//
//  SMSignInWithEmailViewModel.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 26/06/23.
//

import SwiftUI

@MainActor
final class SMSignInWithEmailViewModel: ObservableObject {
    
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
