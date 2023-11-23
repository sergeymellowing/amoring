//
//  PlansView.swift
//  amoring
//
//  Created by 이준녕 on 11/22/23.
//

import SwiftUI

struct PlansView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("PLANS!")

            NavigationLink(destination: {
                BusinessSuccess()
            }) {
                Text("SKIP")
            }
        }
        .padding(16)
    }
}

#Preview {
    PlansView()
}
