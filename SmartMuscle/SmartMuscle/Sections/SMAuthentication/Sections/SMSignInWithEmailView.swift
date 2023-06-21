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
    
    func signUp()  async throws {
        
        guard !email.isEmpty,
              !passsword.isEmpty else {
            print("No email or passowrd")
            return
        }
        
       try await FIRAuthManager.shared.createUser(email: email, password: passsword)
    }
    
    func signIn()  async throws {
        
        guard !email.isEmpty,
              !passsword.isEmpty else {
            print("No email or passowrd")
            return
        }
        
       try await FIRAuthManager.shared.signInUser(email: email, password: passsword)
    }
}

struct SMSignInWithEmailView: View {
    
    @StateObject private var signInEmailVM = SignInWithEmailViewModel()
    @Binding var showsSignView: Bool

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
                Task {
                    do {
                        try await signInEmailVM.signUp()
                        showsSignView = false
                        return
                    } catch {
                        print("DEBUG: signUp \(error)")
                    }
                    
                    do {
                        try await signInEmailVM.signIn()
                        showsSignView = false
                        return
                    } catch {
                        print("DEBUG: signIn \(error)")
                    }
                }
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
        SMSignInWithEmailView(showsSignView: .constant(false))
    }
}
