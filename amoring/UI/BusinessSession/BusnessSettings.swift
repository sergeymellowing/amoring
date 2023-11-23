//
//  BusnessSettings.swift
//  amoring
//
//  Created by 이준녕 on 11/23/23.
//

import SwiftUI

struct BusnessSettings: View {
    @State var someText = ""
    @State var showDistacne = false
    @State var showNumber = false
    @State var showGenderRatio = false
    @State var showMatching = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 20) {
                Text("Please enter your business information")
                Text("Basic Information")
                TextField("Name", text: $someText)
                TextField("Address", text: $someText)
                TextField("Sectors", text: $someText)
                TextField("representative", text: $someText)
                TextField("contact", text: $someText)
                TextField("Company Registration Number", text: $someText)
                
                Divider()
                
                Text("Listing Settings")
                Button(action: {}) {
                    Text("Edit")
                }
                
                Toggle(isOn: $showDistacne) { Text("Show distance") }
                Toggle(isOn: $showNumber) { Text("Show number of people") }
                Toggle(isOn: $showGenderRatio) { Text("Show gender ratio") }
                Toggle(isOn: $showMatching) { Text("Show matching probability") }
                
                Text("images")
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<12) { _ in
                            Color.gray
                                .frame(width: 200, height: 200)
                                .cornerRadius(20)
                        }
                    }
                }
                
                Button(action: {
                    // reset password
                }) {
                    Text("Reset password")
                }
                
                Button(action: {
                    // log out
                }) {
                    Text("Logout")
                }
                
                Button(action: {
                    // Delete account
                }) {
                    Text("Delete account")
                }
            }
            .padding(.horizontal, 16)
        }
        
    }
}

#Preview {
    BusnessSettings()
}