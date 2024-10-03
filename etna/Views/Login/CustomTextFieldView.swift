//
//  CustomTextFieldView.swift
//  Etna
//
//  Created by Tomasz on 02/10/2024.
//

import SwiftUI

struct CustomTextFieldView: View {
    
    var placeholder: String
    
    @State var text: String
    
    var body: some View {
        TextField(LocalizedStringKey(placeholder), text: $text)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10)
                            .fill(Color.secondary.opacity(0.15)))
            .keyboardType(.alphabet)
            .disableAutocorrection(true)
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(placeholder: "Token", text: "").previewLayout(.sizeThatFits)
    }
}
