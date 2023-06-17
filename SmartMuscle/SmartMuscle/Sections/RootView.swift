//
//  RootView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 17/06/23.
//

import SwiftUI

struct RootView: View {
    
    @State private var showSigInView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
               SMTabBarView()
            }
        }
        .onAppear{
            let authUser = try? FIRAuthManager.shared.getUserAuthenticateUser()
            self.showSigInView = authUser == nil ? true : false
        }
        .fullScreenCover(isPresented: $showSigInView) {
            NavigationStack {
                SMAutheticationView()
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
