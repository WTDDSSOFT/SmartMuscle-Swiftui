//
//  FIRDataBaseManager.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 27/06/23.
//

import FirebaseDatabase

@MainActor
final class FIRDataBaseManager {

    static let shared = FIRDataBaseManager()
    
    var ref = Database.database().reference()

    init () { }
}

extension FIRDataBaseManager {
    
    func addUserOnRealTimeDB(authResultModel: FIRAuthDataResultModel) async throws {
       
        guard let email = authResultModel.email else {
            print("Failed to create user reference in database")
            return 
        }
        
        let values: [String: Any] = ["uid": authResultModel.uid,
                      "email": email,
                      "photoUrl": authResultModel.photoUrl ?? ""
        ]
        
        do {
            try await ref.child("users").child(authResultModel.uid).updateChildValues(values)
            print("success to create user reference on the database")

        } catch {
            print("Failed to create user reference on the database")
        }
    }
}
 
