//
//  SettingsView.swift
//  amoring
//
//  Created by 이준녕 on 11/23/23.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("Pumpkin")
            Color.gray
                .frame(width: 200, height: 200)
                .clipShape(Circle())
            Text("Please upload a photo of your business that you are proud of. This photo will be registered on the list.")
            Divider()
            NavigationLink(destination: {
                BusnessSettings()
            }) {
                Text("Account Information")
            }
            
            NavigationLink(destination: {
                Text("Subscription Settings")
            }) {
                Text("Subscription Settings")
            }
            
            Divider()
        }
    }
}

#Preview {
    SettingsView()
}
