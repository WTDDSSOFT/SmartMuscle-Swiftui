//
//  FIRAuthManager.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 17/06/23.
//

import FirebaseAuth

enum AuthProviderOption: String {
    case email = "password"
    case google = "google.com"
    case apple = "apple.com"
}

@MainActor
final class FIRAuthManager {
    
    static let shared = FIRAuthManager()
    
    private let database = FIRDataBaseManager()
    
    private init() { }

    func getUserAuthenticateUser() throws -> FIRAuthDataResultModel {
        
        guard let user = Auth.auth().currentUser else  {
            throw URLError(.badServerResponse)
        }
        return FIRAuthDataResultModel(user: user)
    }
    
    func getProviders() throws -> [AuthProviderOption] {
        
        guard let providerData = Auth.auth().currentUser?.providerData else {
            throw  URLError(.badServerResponse)
        }
        
        var providers: [AuthProviderOption] = []
        
        for provider in providerData {
            if let option = AuthProviderOption(rawValue: provider.providerID) {
                providers.append(option)
            } else {
                assertionFailure("Provider option not found -> \(provider.providerID)")
            }
        }
        print("DEBUG: User Firebase get the logIn provider -> ",providers)
        return providers
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}

//MARK: SIGN EMAIL FUNCTIONS
extension FIRAuthManager {
    
    @discardableResult
    func createUser(email: String, password: String) async throws -> FIRAuthDataResultModel {
        
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        try await database.addUserOnRealTimeDB(authResultModel: FIRAuthDataResultModel(user: authDataResult.user))
        return FIRAuthDataResultModel(user: authDataResult.user)
    }
    
    @discardableResult
    func signInUser(email: String, password: String) async throws -> FIRAuthDataResultModel  {
        
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        try await database.addUserOnRealTimeDB(authResultModel: FIRAuthDataResultModel(user: authDataResult.user))
        return FIRAuthDataResultModel(user: authDataResult.user)
    }
    
    func resestPassword(email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
    
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else  {
            throw URLError(.badServerResponse)
        }
        
        try await user.updatePassword(to: password)
    }
    
    func updateEmail(email: String) async throws {
        guard let user = Auth.auth().currentUser else  {
            throw URLError(.badServerResponse)
        }
        
        try await user.updateEmail(to: email)
    }
}

// MARK: SIGN IN SSO

extension FIRAuthManager {
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignResultModel) async throws -> FIRAuthDataResultModel {
        
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.accessToken)
        return try await signIn(credential: credential)
    }
    
    @discardableResult
    func signInWithApple(tokens: SignInWithAppleResult)  async throws -> FIRAuthDataResultModel {
        
        let credential =  OAuthProvider.credential(
            withProviderID: AuthProviderOption.apple.rawValue,
            idToken: tokens.token,
            rawNonce:  tokens.nonce)
    
        return try await signIn(credential: credential)
    }
    
    func signIn(credential: AuthCredential) async throws  -> FIRAuthDataResultModel {
        
        let authDataResult = try await Auth.auth().signIn(with: credential)
        try await database.addUserOnRealTimeDB(authResultModel: FIRAuthDataResultModel(user: authDataResult.user))
        return FIRAuthDataResultModel(user: authDataResult.user)
    }
    
}
