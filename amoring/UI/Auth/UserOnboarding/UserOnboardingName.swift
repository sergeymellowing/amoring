//
//  UserOnboardingStep1.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingName: View {
    @Binding var user: User
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step1")
            Text("Input your name")
            TextField("", text: $user.name ?? "name")
            Text("Visible to other users and cannot be changed after registration")
            NavigationLink(destination: { UserOnboardingGender() }) {
                Text("Next")
            }
        }
    }
}

#Preview {
    UserOnboardingName(user: .constant(User()))
}


