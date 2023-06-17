//
//  SmartMuscleApp.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 18/05/23.
//

import SwiftUI

@main
struct SmartMuscleApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegateAdapter.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
