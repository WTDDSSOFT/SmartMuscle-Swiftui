//
//  UpgradToPro.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 22/05/23.
//

import SwiftUI

struct UpgradToPro: View {
    
    var body: some View {
        HStack {
            ProCardView()
        }
    }
}

struct UpgradToPro_Previews: PreviewProvider {

    static var previews: some View {
        UpgradToPro()
            .previewLayout(.sizeThatFits)
    }
}

struct ProCardView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("PRO")
                .foregroundColor(.white)
                .font(.system(size: 18,weight: .bold, design: .default))
                .frame(width: 40, height: 0)
                .padding(.all)
                .background(.red)
                .clipShape(Capsule())
            HStack {
                Text("Upgrade to Premium")
                    .foregroundColor(.white)
                    .font(.system(size: 18,weight: .semibold, design: .default))
                Spacer()
                HStack {
                    Image(systemName: "chevron.compact.right")
                        .foregroundColor(.white)
                        .foregroundColor(.blue)
                        .padding(.all)
                        .scaledToFit()
                }
            }.padding(.top)

            Text("This subscription is auto-renewable")
                .foregroundColor(.white)
                .font(.system(size: 14,weight: .regular, design: .default))

        }.padding(.all)
            .background(Color.init(uiColor: .darkUpgrateToPro))
    }
}
