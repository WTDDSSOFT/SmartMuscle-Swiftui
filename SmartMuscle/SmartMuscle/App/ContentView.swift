//
//  ContentView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 18/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            WorkOutPlan()
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
                .tabItem {
                    Image(systemName: "figure.arms.open")
                    Text("BodyView")
                }
            Settings()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            
        } // MARK: - TabView
        .edgesIgnoringSafeArea(.top)
        .accentColor(Color(.goldBackground))
    } //MARK: -  body
} //MARK: - ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
