//
//  EditProfileView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 24/06/23.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        List {
            Section {
                Button {
                    print("Tap tap Change img")
                } label: {
                    VStack(spacing: 10) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .clipped()
                            .frame(width: 40, height: 40)
                        Text("Edit")
                            .font(.system(size: 18,
                                          weight: .regular,
                                          design: .default))
                    }
                }
                Text("Smart Muscle")
            }
                        
            Section("Profile") {
                Text("Name")
                Text("Email")
                Text("Password")
            }
            
        }
        .foregroundColor(Color(uiColor: .goldBackground))
        .listStyle(.grouped)
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
