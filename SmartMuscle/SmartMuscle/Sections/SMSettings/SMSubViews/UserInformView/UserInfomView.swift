//
//  UserInfomView.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 22/05/23.
//

import SwiftUI

struct UserInfomView: View {

    var body: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 80, height: 80)
            Spacer()
            MemberDescriptionView()
        }
        .foregroundColor(Color(uiColor: .goldBackground))
    }
}


struct UserInfomView_Previews: PreviewProvider {

    static var previews: some View {
        UserInfomView()
            .previewLayout(.sizeThatFits)

    }
}

struct ProMemberView: View {

    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            Text("Pro Member")
                .foregroundColor(.red)
                .font(.system(size: 11, weight: .semibold, design: .default))

            Text("Until 18 Jul 2022")
                .font(.system(size: 15, weight: .regular, design: .default))

            Text("12 Months Subscription")
                .font(.system(size: 11, weight: .regular, design: .default))
        }
    }
}

struct MemberDescriptionView: View {

    var body: some View {
        VStack {
            Text("Joind")
            Text("2 Months")
            Spacer()
            ProMemberView()
        }
        .frame(width: 146, height: 105)
    }
}
