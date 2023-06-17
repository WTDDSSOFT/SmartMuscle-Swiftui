//
//  FIRAuthManager.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 17/06/23.
//

import FirebaseAuth

struct FIRAuthDataResultModel {
    
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

enum AuthProviderOption: String {
    case password = "paswword.com"
    case google = "google.com"
    case apple = "apple.com"
}

final class FIRAuthManager {
    
    static let shared = FIRAuthManager()
    
    private init() { }
    
    func createUser(email: String, password: String) async throws -> FIRAuthDataResultModel {
        let authResultModel = try await Auth.auth().createUser(withEmail: email, password: password)
        return FIRAuthDataResultModel(user: authResultModel.user)
    }
    
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
                assertionFailure("Provider option not found \(provider.providerID)")
            }
        }
        print(providers)
        return providers
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}


extension FIRAuthManager {
//    @discardableResult
//    func signInWithApple(tokens: String)  async throws -> FIRAuthDataResultModel {
//        let credential = OAuthProvider.appleCredential(withPro,withIDToken: tokens.idToken,
//                                                       rawNonce: tokens.accessToken,
//                                                       fullName: AuthProviderOption.apple.rawValue)
//        return try await sigIn(credential:credential)
//    }
}
