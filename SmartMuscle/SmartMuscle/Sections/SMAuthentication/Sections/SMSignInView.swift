//
//  SignInView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 17/06/23.
//

import SwiftUI

@MainActor
final class SignInWithEmailViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var passsword = ""
    
    func signIn() {
        
        guard !email.isEmpty, !passsword.isEmpty else {
            print("No email or passowrd")
            return
        }
        
        Task {
            do {
               let returnUserData = try await FIRAuthManager.shared.createUser(email: email, password: passsword)
                print(returnUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
}

struct SMSignInView: View {
    
    @StateObject private var signInEmailVM = SignInWithEmailViewModel()
    
    var body: some View {
        VStack {
            TextField("Email", text: $signInEmailVM.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            SecureField("Password", text: $signInEmailVM.passsword)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
                
            
            Button {
                signInEmailVM.signIn()
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
        .navigationTitle("Sig In with Email ")
    }
}

struct SMSignInView_Previews: PreviewProvider {
    static var previews: some View {
        SMSignInView()
    }
}
