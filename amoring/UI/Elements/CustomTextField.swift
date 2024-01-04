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
        TextField("", text: $text)
            .autocorrectionDisabled()
            .placeholder(when: text.isEmpty) {
                Text(placeholder ?? "")
                    .font(regular20Font)
                    .foregroundColor(.gray200)
            }
            .font(semiBold22Font)
            .foregroundColor(.black)
            .padding(.vertical, Size.w(16))
            .padding(.horizontal, Size.w(20))
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
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

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

#Preview {
    VStack {
        CustomTextField(placeholder: "asef", text: .constant("jay@jay.com"))
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.black)
}
