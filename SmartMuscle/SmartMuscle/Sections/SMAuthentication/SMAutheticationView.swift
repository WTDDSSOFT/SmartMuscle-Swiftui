//
//  SignInView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 07/06/23.
//

import SwiftUI
import AuthenticationServices
import GoogleSignIn
import GoogleSignInSwift
import CryptoKit

/**
 
 This  **SignInView** :
 
 important Features
 1. UI.
 1. App Sign Button - ✅
 1. Apple
 2. Google
 2. Background  base on system background - ✅
 2. Security Section the app, we need study.
 1. keyChain -
 */

/** **SignInWithAppleViewRepresentable**:  This struct convert apple uikit button to swiftui button.
 */
@MainActor
struct SignInWithAppleViewRepresentable: UIViewRepresentable {
    
    let type: ASAuthorizationAppleIDButton.ButtonType
    let style: ASAuthorizationAppleIDButton.Style
    
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        ASAuthorizationAppleIDButton(authorizationButtonType: type, authorizationButtonStyle: style)
    }
    
    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {
       
    }
}

struct SMAutheticationView: View {
    
    @Environment(\.colorScheme) var colorSheme
    
    @AppStorage("email") var email: String = ""
    @AppStorage("firstName") var firstName: String = ""
    @AppStorage("lastName") var lastName: String = ""
    @AppStorage("userId") var userId: String = ""
    
    var body: some View {
        VStack(alignment: .center, spacing: 2) {
            
            Image(systemName: "dumbbell")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .foregroundColor(Color(.goldBackground))
            
            Text("Smart Muscle")
                .font(.system(size: 40, weight: .bold, design: .default))
                .foregroundColor(Color(.goldBackground))
            
            Spacer()
            
            Text("Chose your one!")
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(Color(.goldBackground))
                .padding(.all)
            
            Button {
                
            } label: {
                SignInWithAppleViewRepresentable(type: .default, style: .black)
                    .allowsHitTesting(false)
            }
            .frame(height:  55)
            
            
            GoogleSignInButton(
                viewModel: GoogleSignInButtonViewModel(
                    scheme: .dark,
                    style:.wide,
                    state: .normal)
            ) {
                
            }
            .frame(height: 55)
            .padding()
            .cornerRadius(8)
            
            Spacer()
            
            Text("@Develop by WTDDSSOFT/ IDevelor Company")
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .padding(.all)
                .foregroundColor(Color(.goldBackground))
            
            
        }.padding(.all)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SMAutheticationView()
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
