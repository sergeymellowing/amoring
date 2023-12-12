//
//  amoringApp.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI
@main
struct amoringApp: App {
    var body: some Scene {
        WindowGroup {
            /// graphql demo
//            RocketListView()
            
            ContentView()
                .preferredColorScheme(.dark)
            // TODO: remove for different languages
                .environment(\.locale, .init(identifier: "ko"))
                .onAppear {
                    setupUI()
                }
        }
    }

    func setupUI() {
        /// Hides native TabBar
        UITabBar.appearance().isHidden = true
    }
}
