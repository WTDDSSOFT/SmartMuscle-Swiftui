//
//  SMTabBarView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 17/06/23.
//

import SwiftUI

struct SMTabBarView: View {
    @Binding var showSignInView: Bool
    
    var body: some View {
        TabView {
            WorkOutPlan()
                .navigationTitle("Test")
                .tabItem {
                    Image(systemName: "dumbbell")
                    Text("WorkOutPlan")
                }
            DietePlan()
            
                .tabItem {
                    Image(systemName: "light.recessed")
                    Text("DietePlan")
                }
            BodyView()
                .navigationTitle("DieteBodyViewPlan")
                .tabItem {
                    Image(systemName: "figure.arms.open")
                    Text("BodyView")
                }
            SettingsView(showSignInView: $showSignInView)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        }// MARK: - TabView
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color(.goldBackground))
    }
}

struct SMTabBarView_Previews: PreviewProvider {
    static var previews: some View {
        SMTabBarView(showSignInView: .constant(false))
    }
}
