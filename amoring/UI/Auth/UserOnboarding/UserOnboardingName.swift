//
//  UserOnboardingName.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingName: View {
    @EnvironmentObject var controller: UserOnboardingController
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step1")
            Text("Input your name")
            CustomTextField(text: $controller.user.name ?? "")

            Text("Visible to other users and cannot be changed after registration")
            NavigationLink(destination: {
                UserOnboardingGender()
            }) {
                Text("Next")
            }
        }.padding(16)
    }
}

#Preview {
    UserOnboardingName()
}


