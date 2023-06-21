//
//  Settings.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 18/05/23.
//

import SwiftUI


struct SettingsView: View {
    
    @StateObject private var settingsVM = SettingsViewModel()
    @Binding var showSignInView: Bool

    var body: some View {
        NavigationView {
            List {
                UserInfomView()
                Button {
                    Task {
                        do {
                            try settingsVM.signOut()
                            print("success log out !")
                        } catch {
                            print(error)
                        }
                    }
                } label: {
                    Text("Log out ")
                }
                if settingsVM.authProviders.contains(.email) {
                    emailSectionView
                }
            }
            .navigationTitle("SettingsView")
        }
        .onAppear{
            settingsVM.loadAithProviders()
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(showSignInView: .constant(false))
    }
}

struct SectionText: View {
    @State var title: String
    var body: some View {
        Text(title)
    }
}

extension SettingsView {
    
    private var emailSectionView: some View {
        Section {
            //                    SectionText(title: "Profile")
            //                    SectionText(title: "Privacy Policy")
            //                    SectionText(title: "Units of Measure")
            //                    SectionText(title: "Notifications")
            //                    SectionText(title: "Contact Us")
            //                    SectionText(title: "Language")
            //                    UpgradToPro().cornerRadius(12)
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
                Text("Update password ")
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
            
        } header: {
            Text("Email functions")
        }
    }
}
