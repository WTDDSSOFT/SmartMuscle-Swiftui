//
//  FIRAuthDataResultModel.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 27/06/23.
//
import FirebaseAuth
import UIKit

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
