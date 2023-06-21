//
//  XMarkButton.swift
//  SmartMuscle
//
//  Created by william torres dias dos santos on 22/05/23.
//

import SwiftUI

struct XMarkButton: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Button {
            print("tap tap ")
            dismiss.callAsFunction()
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
        }
    }
}

struct XMarkButton_Previews: PreviewProvider {
    static var previews: some View {
        XMarkButton().previewLayout(.sizeThatFits)
    }
}
