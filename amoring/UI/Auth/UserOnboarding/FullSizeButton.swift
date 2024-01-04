//
//  FullSizeButton.swift
//  amoring
//
//  Created by 이준녕 on 1/4/24.
//

import SwiftUI

struct FullSizeButton: View {
    let title: String
    var enabled: Bool = true
    
    var body: some View {
        Text(title)
            .font(medium18Font)
            .foregroundColor(.gray150)
            .padding(.vertical, Size.w(16))
            .frame(maxWidth: .infinity)
            .background(Color.gray1000)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .opacity(enabled ? 1 : 0.3)
    }
}

#Preview {
    FullSizeButton(title: "", enabled: true)
}
