//
//  SMTextField.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 07/06/23.
//

import SwiftUI

struct SMTextField: View {
    
    @State var inputTitle: String
    @State var inputText: String
    
    var body: some View {
        TextField(inputTitle, text: $inputText)
            .foregroundColor(Color(.secondaryLabel))
            .frame(height: 55)
            .padding([.horizontal], 10)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(5)
    }
    
}

struct SMTextField_Previews: PreviewProvider {
    static var previews: some View {
        SMTextField(inputTitle: "", inputText: "").previewLayout(.sizeThatFits)
    }
}

