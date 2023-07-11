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
                ListSettings
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
    
    private var ListSettings: some View {
        List {
            Section {
                NavigationLink {
                    EditProfileView()
                } label: {
                    HStack(alignment: .center, spacing: 10) {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("User Name")
                            .font(.system(size: 18,
                                          weight: .regular,
                                          design: .default))
                    }
                }
            }
            
            Section {
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
            
        }
        .foregroundColor(Color(uiColor: .goldBackground))
        .lineSpacing(10)
        .listStyle(.grouped)
    }
}
