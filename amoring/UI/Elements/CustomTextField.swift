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
    var font: Font = semiBold22Font
  
    var body: some View {
        TextField("", text: $text)
            .autocorrectionDisabled()
            .placeholder(when: text.isEmpty) {
                Text(placeholder ?? "")
                    .font(regular20Font)
                    .foregroundColor(.gray200)
            }
            .font(font)
            .foregroundColor(.black)
            .padding(.vertical, Size.w(16))
            .padding(.horizontal, Size.w(20))
            .background(RoundedRectangle(cornerRadius: 12).fill(Color.white))
    }
}

@available(iOS 16.0, *)
struct MultilineCustomTextField: View {
    var placeholder: String? = nil
    @Binding var text: String
    var font: Font = semiBold18Font
    
    var body: some View {
        TextField("", text: $text, axis: .vertical)
            .autocorrectionDisabled()
            .lineLimit(3)
            .placeholder(when: text.isEmpty) {
                Text(placeholder ?? "")
                    .font(regular20Font)
                    .foregroundColor(.gray200)
            }
            .font(font)
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
