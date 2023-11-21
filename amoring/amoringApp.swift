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
            ContentView()
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
