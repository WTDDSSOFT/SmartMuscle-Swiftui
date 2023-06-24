//
//  UpgradToPro.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 22/05/23.
//

import SwiftUI

struct UpgradToProView: View {
    
    var body: some View {
        ZStack {
            ProCardView
        }
    }
}

struct UpgradToPro_Previews: PreviewProvider {
    
    static var previews: some View {
        UpgradToProView()
            .previewLayout(.sizeThatFits)
    }
}

extension UpgradToProView {
    
    private var ProCardView: some View {
        
        VStack(alignment: .leading) {
            
            Text("PRO")
                .font(.system(
                    size: 18,
                    weight: .bold,
                    design: .default)
                )
                .foregroundColor(.white)
                .frame(width: 40, height: 0)
                .padding(.all)
                .background(.red)
                .clipShape(Capsule())
            
            HStack {
                Text("Upgrade to Premium")
                    .font(.system(
                        size: 18,
                        weight: .semibold,
                        design: .default)
                    )
                
                Spacer()
                
                HStack {
                    Image(systemName: "chevron.compact.right")
                        .frame(width: 32, height: 32)
                        .scaledToFit()
                }
            }
            
            Text("This subscription is auto-renewable")
                .font(.system(
                    size: 14,
                    weight: .regular,
                    design: .default)
                )
        }
        .frame(maxHeight: 85)
        .padding(.all)
        .foregroundColor(Color(uiColor: .goldBackground))
        .background(Color.init(uiColor: .darkUpgrateToPro))
        .cornerRadius(10)
    }
}
