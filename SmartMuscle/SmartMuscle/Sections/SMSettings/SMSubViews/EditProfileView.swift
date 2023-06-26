//
//  EditProfileView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 24/06/23.
//

import SwiftUI

struct EditProfileView: View {
    
    @StateObject var settingsVM: SettingsViewModel

    var body: some View {
        List {
            Section {
             
            }
            
            Section("Profile") {
                Text("Type of prfile")
                if settingsVM.authProviders.contains(.email) {
                    emailSectionView
                }
            }
        }
        .foregroundColor(Color(uiColor: .goldBackground))
        .listStyle(.grouped)
    }
}


struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(settingsVM: .init())
    }
}

extension EditProfileView {

    private var emailSectionView: some View {
        Section {
            Button {
                Task {
                    do {
                        try await settingsVM.resetPassword()
                        print("Password reset !")
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Reset passsword")
            }
            
            Button {
                Task {
                    do {
                        try await settingsVM.updatePasswordl()
                        print("success log out !")
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Update password")
            }
            
            Button {
                Task {
                    do {
                        try await settingsVM.updateEmail()
                        print("success log out !")
                    } catch {
                        print(error)
                    }
                }
            } label: {
                Text("Update email ")
            }
        }
    }
}
