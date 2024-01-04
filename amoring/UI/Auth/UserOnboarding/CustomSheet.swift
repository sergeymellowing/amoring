//
//  CustomSheet.swift
//  amoring
//
//  Created by 이준녕 on 1/4/24.
//

import SwiftUI

struct CustomSheet<Content: View>: View {
    @ViewBuilder let content: Content
    var body: some View {
        VStack {
            content
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.gray150)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .transition(.move(edge: .bottom))
    }
}

#Preview {

    
    ZStack {
        Color.red.ignoresSafeArea()
        CustomSheet() {
            Text("Picker here")
        }
    }
}
