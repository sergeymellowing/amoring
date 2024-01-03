//
//  CustomTextField.swift
//  amoring
//
//  Created by 이준녕 on 12/4/23.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String? = nil
    @Binding var text: String
    
//    init(_ placeholder: String = "", text: Binding<String>) {
//        self.placeholder = placeholder
//        self._text = text
//    }
    
    var body: some View {
        TextField(placeholder ?? "", text: $text)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 12).fill(Color.white))
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
    VStack {
        CustomTextField(placeholder: "asef", text: .constant("jay@jay.com"))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.black)
}
