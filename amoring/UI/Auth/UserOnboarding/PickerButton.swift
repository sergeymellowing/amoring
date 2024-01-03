//
//  PickerButton.swift
//  amoring
//
//  Created by 이준녕 on 1/3/24.
//

import SwiftUI

struct PickerButton: View {
    @Binding var age: Int?
    var body: some View {
        HStack {
            if let age {
                Text(age.description)
                    .foregroundColor(.black)
            } else {
                Text("선택하기")
                    .foregroundColor(.gray400)
            }
            
            Spacer()
            Image(systemName: "chevron.down")
                .foregroundColor(.yellow350)
                .font(regular22Font)
        }
        .padding(.vertical, Size.w(16))
        .padding(.horizontal, Size.w(20))
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .font(semiBold22Font)
    }
}

//#Preview {
//    PickerButton()
//}
