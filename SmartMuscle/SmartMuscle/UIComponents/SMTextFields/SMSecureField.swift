//
//  SMSecureField.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 07/06/23.
//

import SwiftUI

struct SMSecureField: View {
    
    @State var inputPassword: String
    @State var inputText: String
    
    var body: some View {
        SecureField(inputPassword, text: $inputText)
            .foregroundColor(Color(.secondaryLabel))
            .frame(height: 55)
            .padding([.horizontal], 10)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(5)
    }
}

struct SMSecureField_Previews: PreviewProvider {
    static var previews: some View {
        SMSecureField(inputPassword: "", inputText: "")
            .previewLayout(.sizeThatFits)
    }
}
