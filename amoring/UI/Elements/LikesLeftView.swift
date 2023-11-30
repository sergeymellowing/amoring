//
//  LikesLeftView.swift
//  amoring
//
//  Created by 이준녕 on 11/30/23.
//

import SwiftUI

struct LikesLeftView: View {
    let likes: Int
    var body: some View {
        HStack {
            Image("ic-heart-fill")
            likes > 0 ?
            (Text("+") + Text(likes.description))
            : Text(likes.description)
        }
        .font(semiBold12Font)
        .foregroundColor(.yellow200)
        .padding(.vertical, 9)
        .padding(.horizontal, 14)
        .overlay(
            Capsule().stroke(Color.gray900)
        )
    }
}

#Preview {
    VStack {
        LikesLeftView(likes: 12)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray1000)
}
