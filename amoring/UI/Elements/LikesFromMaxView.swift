//
//  LikesFromMaxView.swift
//  amoring
//
//  Created by 이준녕 on 11/30/23.
//

import SwiftUI

struct LikesFromMaxView: View {
    let likes: Int
    var maxLikes: Int = 4
    
    var body: some View {
        HStack {
            Image("ic-heart-empty")
            
            Text(likes.description) +
            Text("/") +
            Text(maxLikes.description)
        }
        .font(semiBold12Font)
        .foregroundColor(.gray200)
        .padding(.vertical, 9)
        .padding(.horizontal, 14)
        .overlay(
            Capsule().stroke(Color.gray900)
        )
    }
}

#Preview {
    VStack {
        LikesFromMaxView(likes: 2)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.gray1000)
}
