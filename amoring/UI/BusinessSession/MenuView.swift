//
//  MenuView.swift
//  amoring
//
//  Created by 이준녕 on 11/23/23.
//

import SwiftUI

struct MenuView: View {
    @State var isLocked = true
    
    var body: some View {
        ZStack {
            if isLocked {
                BusinessEnterView(isLocked: $isLocked)
            } else {
                SettingsView()
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

#Preview {
    MenuView()
}
