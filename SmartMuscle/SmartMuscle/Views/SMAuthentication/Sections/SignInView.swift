//
//  SignInView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 07/06/23.
//

import SwiftUI
import AuthenticationServices

/**
 
 This  **SignInView** :
 
 important Features
   1. UI.
    1. App Sign Button - ✅
    2. Background  base on system background - ✅
  2. Security Section the app, we need study.
    1. keyChain -
 */

struct SignInView: View {
    @Environment(\.colorScheme) var colorSheme

    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""

    var body: some View {
        VStack(spacing: 10) {
//
//            SignInFieldsView()
            Spacer()
            SignInWithAppleButton(.continue) { request in
                request.requestedScopes = [.email, .fullName]
            } onCompletion: { resutl in
                switch resutl {
                case .success(let auth):
                    
                    switch auth.credential {
            
                    case let credential as ASAuthorizationAppleIDCredential:
                        ///user id
                        let userId = credential.user
                        /// user info
                        let email = credential.email
                        let firstName = credential.fullName?.givenName
                        let lastName = credential.fullName?.familyName
                        
                        
                        self.email = email ?? ""
                        self.userId = userId
                        self.firstName = firstName ?? ""
                        self.lastName = lastName ?? ""
                        break
                    default:
                        break
                    }
                case .failure(let error):
                    print(error)
                }
            }.signInWithAppleButtonStyle(
                colorSheme == .dark ? .white : .black
            )
            .frame(height: 50)
            .padding()
            .cornerRadius(8)
        
            Spacer()
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}

struct SignInFieldsView: View {
    
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var fullNameText: String = ""
    @State var userNameText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            VStack {
                Image(systemName: "dumbbell")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .foregroundColor(Color(.secondaryLabel))
                    .padding(.all)
                Text("Smart Muscle")
                    .font(.system(size: 30, weight: .semibold, design: .default))
            }
            .padding(.all)
            
            SMTextField(inputTitle: "Email", inputText: emailText)
            SMSecureField(inputPassword: "Passsword", inputText: passwordText)
            
        }.padding(.all)
    }
}
