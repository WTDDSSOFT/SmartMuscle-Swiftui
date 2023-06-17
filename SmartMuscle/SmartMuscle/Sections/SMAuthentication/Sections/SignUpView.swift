//
//  SignUpView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 07/06/23.
//

import SwiftUI

struct SignUpView: View {
    
    var body: some View {
        ZStack {
            VStack {
                InputFieldsView()
                Spacer()
          
                Button {
                    print("Tap registraiton button")
                } label: {
                    Text("Registration")
                        .background(Color(.secondarySystemBackground))
                        .padding(.all)
                        .foregroundColor(Color(.secondaryLabel))
                }
            }
        }.background(Color(UIColor.systemBackground))
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}


struct InputFieldsView: View {
    
    @State var emailText: String = ""
    @State var passwordText: String = ""
    @State var fullNameText: String = ""
    @State var userNameText: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            Image(systemName: "dumbbell")
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .foregroundColor(Color(.secondaryLabel))
            
            SMTextField(inputTitle: "Full Name", inputText: fullNameText)
            SMTextField(inputTitle: "User Name", inputText: userNameText)
            SMTextField(inputTitle: "Email", inputText: emailText)
            SMSecureField(inputPassword: "Passsword", inputText: passwordText)
            
        }.padding(.all)
    }
}
