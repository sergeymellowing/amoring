//
//  UserOnboardingView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct UserOnboardingView: View {
    @State var name = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step1")
            Text("Input your name")
            TextField("", text: $name)
            Text("Visible to other users and cannot be changed after registration")
            NavigationLink(destination: {}) {
                
            }
        }
    }
}

#Preview {
    UserOnboardingView()
}
