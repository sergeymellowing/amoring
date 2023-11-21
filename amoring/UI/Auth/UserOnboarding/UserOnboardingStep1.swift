//
//  UserOnboardingStep1.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingStep1: View {
    @State var name = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step1")
            Text("Input your name")
            TextField("", text: $name)
            Text("Visible to other users and cannot be changed after registration")
            NavigationLink(destination: { UserOnboardingStep2() }) {
                Text("Next")
            }
        }
    }
}

#Preview {
    UserOnboardingStep1()
}
