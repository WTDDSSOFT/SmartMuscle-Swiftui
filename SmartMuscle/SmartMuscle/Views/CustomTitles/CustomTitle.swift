//
//  CustomTitle.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 24/06/23.
//

import SwiftUI


struct CustomTitle: View {
    
    @State var title: String
    
    var body: some View {
        
        Text(title)
            .font(.system(
                size: 18,
                weight: .regular,
                design: .default)
            )
    }
}

struct CustomTitle_Previews: PreviewProvider {
    static var previews: some View {
        CustomTitle(title: "")
            .previewLayout(.sizeThatFits)
    }
}
