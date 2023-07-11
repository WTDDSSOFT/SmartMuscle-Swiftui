//
//  FIRStoaegeManager.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 26/06/23.
//

import FirebaseStorage
import FirebaseDatabase
import UIKit

@MainActor
final class FIRStorageManager {
    
    static let shared = FIRStorageManager()
    
    private var databaseReference = Database.database().reference()
    private let storageReference =  Storage.storage().reference()
    
    private init() { }
    
}

extension FIRStorageManager {
    
    public func uploadUserProfilePicture(by FIRAuthCredential: FIRAuthDataResultModel, image: UIImage?) async throws {
        let path = FIRAuthCredential.uid
        
        guard let pngData = image?.jpegData(compressionQuality: 0.3) else { return }
        
        let storagePhotoUrlReference = databaseReference.child("users/\(path)/photoUrl")
        let storageImageReference = storageReference.child("profile_avatar/\(path)")
        
        storageImageReference.putData(pngData, metadata: nil) { metaData, error in
            
            guard metaData != nil, error == nil else {
                print("Failed to upload avatar image to the Firebase storage \(String(describing: error?.localizedDescription))")
                return
            }
            
            storageImageReference.downloadURL { (url, error) in
                guard let profileImageUrl = url?.absoluteString else {
                    print("Failed to update profileImageUrl")
                    return
                }
                storagePhotoUrlReference.setValue(profileImageUrl)
            }
        }
    }
}
