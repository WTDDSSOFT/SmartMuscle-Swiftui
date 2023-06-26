//
//  EditProfileView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 24/06/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @StateObject var settingsVM: SettingsViewModel
    
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Data? = nil
    
    var body: some View {
        List {
            
            Section {
                VStack {
                    PhotosPicker(
                        selection: $avatarItem,
                        matching: .images,
                        photoLibrary: .shared()) {
                            
                            if let avatarImage = avatarImage, let uiImage = UIImage(data: avatarImage) {
                                Image(uiImage: uiImage)
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                            } else {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                            }
                        }
                        .onChange(of: avatarItem) { _ in
                            Task {
                                if let data = try? await avatarItem?.loadTransferable(type: Data.self) {
                                    avatarImage = data
                                }
                            }
                        }
                    Text("Edit")
                        .font(.system(size: 15,
                                      weight: .bold,
                                      design: .default)
                        )
                }
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
