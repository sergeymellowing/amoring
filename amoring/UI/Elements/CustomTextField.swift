//
//  CustomTextField.swift
//  amoring
//
//  Created by 이준녕 on 12/4/23.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    
    init(_ placeholder: String = "", text: Binding<String>) {
        self.placeholder = placeholder
        self._text = text
    }
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray100))
    }
}

struct CustomSecureField: View {
    @Binding var text: String
    var body: some View {
        SecureField("", text: $text)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray100))
    }
}

#Preview {
    CustomTextField("", text: .constant("jay@jay.com"))
}
