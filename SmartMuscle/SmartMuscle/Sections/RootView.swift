//
//  RootView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 17/06/23.
//

import SwiftUI

/**
 **Doubt**
  Swiftui view hiarchy on this rootView is build the corrected way or not, beacueses on the view debbuging show a lot others views.
  Need to do a search about the correct away to create the TabBarView with navigationView, on each view inside at TabBarView i add navigaionView. But this is the correct way!, I need to search about that.
 
 
 */
struct RootView: View {
    
    @State private var showSigInView: Bool = false
    
    var body: some View {
        ZStack {
            if !showSigInView {
                SMTabBarView(showSignInView: $showSigInView)
            }
        }
        .onAppear{
            let authUser = try? FIRAuthManager.shared.getUserAuthenticateUser()
            self.showSigInView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSigInView) {
            NavigationStack {
                SMAutheticationView(showSignInView: $showSigInView)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
