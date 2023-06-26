//
//  SignInView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 07/06/23.
//

import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import SwiftUI

/**
 This  **SignInView** :
 
 important Features
 1. UI.
 1. App Sign Button - ✅
 1. Apple - ✅
 2. Google - ✅
 2. Background  base on system background - ✅
 2. Security Section the app, we need study.
 1. keyChain - ?
 */

struct SMAutheticationView: View {
    
    @Environment(\.colorScheme) var colorSheme
    @Binding var showSignInView: Bool
    
    @StateObject private var SMAutehticationVM = SMAutheticationViewModel()
    
    var body: some View {
        VStack(alignment: .center, spacing: 1) {
            
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
            
            VStack(spacing: 15) {
                NavigationLink {
                    SMSignInWithEmailView(showsSignView: $showSignInView)
                } label: {
                    Text("Sign In with Email")
                        .font(.headline)
                        .foregroundColor(Color(.goldBackground))
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.4))
                        .cornerRadius(8)
                }
                
                GoogleSignInButton(
                    viewModel: GoogleSignInButtonViewModel(
                        scheme: .dark,
                        style: .wide,
                        state: .normal)
                ) {
                    Task {
                        do {
                            try await SMAutehticationVM.signInGoogle()
                            showSignInView = false
                        } catch {
                            print(error)
                        }
                    }
                }
                .frame(height: 55)
                .cornerRadius(8)
                
                signInWithAppleButton
            }
            
            Spacer()
            
            Text("@Develop by WTDDSSOFT/ IDevelor Company")
                .font(.system(size: 15, weight: .regular, design: .rounded))
                .padding(.all)
                .foregroundColor(Color(.goldBackground))
            
            
        }.padding(.all)
    }
}

struct SMAutheticationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            SMAutheticationView(showSignInView: .constant(false))
        }
    }
}

extension SMAutheticationView {
    
    private var signInWithAppleButton: some View {
        Button {
            Task {
                do {
                    try await SMAutehticationVM.signInApple()
                    showSignInView = false
                } catch {
                    print(error)
                }
            }
        } label: {
            if self.colorSheme == .dark {
                SignInWithAppleViewRepresentable(type: .default, style: .white)
                .allowsHitTesting(false)
            } else if self.colorSheme == .light {
                SignInWithAppleViewRepresentable(type: .default, style: .black)
                .allowsHitTesting(false)
            }
        }
        .frame(height:  55)
    }
}
