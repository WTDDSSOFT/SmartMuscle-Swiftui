//
//  SMAutheticationViewModel.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 26/06/23.
//

import SwiftUI

@MainActor
final class SMAutheticationViewModel: ObservableObject {
    
    let signInAppleHelper = SignInAppleHelper()
    
    func signInGoogle() async throws {
        let helper = SignInGoogleHelper()
        let tokens = try await helper.signIn()
        try await FIRAuthManager.shared.signInWithGoogle(tokens: tokens)
    }
    
    func signInApple() async throws {
        let helper = SignInAppleHelper()
        let tokens = try await helper.startSignInWithAppleFlow()
        try await FIRAuthManager.shared.signInWithApple(tokens: tokens)
    }
}

