//
//  Settings.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 18/05/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @StateObject private var settingsVM = SettingsViewModel()
    @Binding var showSignInView: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section{
                        UserInfomView()
                            .padding()
                    }
                    Section {
                        NavigationLink{
                            EditProfileView()
                        } label: {
                            CustomTitle(title: "Profile")
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            CustomTitle(title: "Notifications")
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            CustomTitle(title: "Contact Us")
                        }
                        NavigationLink {
                            
                        } label: {
                            CustomTitle(title: "Language")
                        }
                    }
                    
                    Section {
                        NavigationLink {
                            
                        } label: {
                            CustomTitle(title: "Units of Measure")
                        }
                        
                        NavigationLink {
                            
                        } label: {
                            CustomTitle(title: "Privacy Policy")
                        }
                    }
                    
                    Section {
                        UpgradToProView()
                        
                        Button {
                            Task {
                                do {
                                    try settingsVM.signOut()
                                    presentationMode.wrappedValue.dismiss()
                                    
                                    print("success log out !")
                                } catch {
                                    print(error)
                                }
                            }
                        } label: {
                            Text("Log out ")
                        }
                    }
                    
                    if settingsVM.authProviders.contains(.email) {
                        emailSectionView
                    }
                }
                .foregroundColor(Color(uiColor: .goldBackground))
                .lineSpacing(10)
                .listStyle(.grouped)
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

extension SettingsView {
    
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
