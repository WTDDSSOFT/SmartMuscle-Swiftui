//
//  SMSettingsViewModel.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 20/06/23.
//

import SwiftUI

@MainActor
final class SettingsViewModel: ObservableObject {
    
    @Published var authProviders: [AuthProviderOption] = []
    
    func loadAithProviders() {
        if let providers = try? FIRAuthManager.shared.getProviders() {
            authProviders = providers
        }
    }
    
    func signOut() throws {
        try FIRAuthManager.shared.signOut()
    }
    
    func resetPassword() async throws {
        
        let authUser  = try FIRAuthManager.shared.getUserAuthenticateUser()
        
        guard let email = authUser.email else {
            throw URLError(.fileDoesNotExist)
        }
        
        try await FIRAuthManager.shared.resestPassword(email: email)
    }
    
    func updateEmail() async throws {
        let email = "smoffice01@gmail.com"
        try await FIRAuthManager.shared.updateEmail(email: email)
    }
    
    func updatePasswordl() async throws {
        let password = "123456789"
        try await FIRAuthManager.shared.updatePassword(password: password)
    }
}


