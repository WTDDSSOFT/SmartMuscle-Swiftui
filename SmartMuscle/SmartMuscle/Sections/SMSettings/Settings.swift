//
//  Settings.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 18/05/23.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationStack {
            Form {
                UserInfomView()
                Section("William santos") {
                    SectionText(title: "Profile")
                    SectionText(title: "Privacy Policy")
                    SectionText(title: "Units of Measure")
                    SectionText(title: "Notifications")
                    SectionText(title: "Contact Us")
                    SectionText(title: "Language")
                    UpgradToPro().cornerRadius(12)
                }
            }
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton()
                }
            }
        }.background(Color(uiColor: .darkBackground))
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}

struct SectionText: View {
    @State var title: String
    var body: some View {
        Text(title)
    }
}
