//
//  AppDelegateAdapter.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 16/06/23.
//

import SwiftUI
import FirebaseCore

class AppDelegateAdapter: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
}
