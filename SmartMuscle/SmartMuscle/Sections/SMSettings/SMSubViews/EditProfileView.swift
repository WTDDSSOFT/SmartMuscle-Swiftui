//
//  EditProfileView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 24/06/23.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    
    @StateObject private var settingsVM = SettingsViewModel()
    @State private var avatarItem: PhotosPickerItem?
    @State private var avatarImage: Data? = nil
    
    var body: some View {
        List {
            Section {
                VStack {
                    avatarPhotoPicker
                    Text("Edit")
                        .font(.system(size: 15,
                                      weight: .bold,
                                      design: .default))
                }
            }
            Section("Profile") {
                Text("Type of prOfile")
                if settingsVM.authProviders.contains(.email) {
                    emailSectionView
                }
            }
        }// MARK: - List
        .foregroundColor(Color(uiColor: .goldBackground))
        .listStyle(.grouped)
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
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
                        try await settingsVM.updatePasswordURL()
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
    } // MARK: - emailSectionView
    
    private var avatarPhotoPicker: some View {
        
        PhotosPicker(selection: $avatarItem,
                     matching: .images,
                     photoLibrary: .shared()
        ) {
            if let avatarImage = avatarImage,
               let uiImage = UIImage(data: avatarImage) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
            } else {
                Image(systemName: "person.circle")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 80, height: 80)
            }
        }
        .onChange(of: avatarItem) { _ in
             Task {
                 if let data = try? await avatarItem?.loadTransferable(type: Data.self),
                    let authUserCredential = try? FIRAuthManager.shared.getUserAuthenticateUser() {
                     
                     avatarImage = data
                     try? await settingsVM.uploadAvatarImage(
                        authUserCredential: authUserCredential,
                        image: UIImage(data: data)
                     )
                 }
             }
         }
    } // MARK: - avatarPhotoPicker
}

