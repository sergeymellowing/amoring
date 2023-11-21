//
//  UserOnboardingStep2.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingStep2: View {
    enum genderType {
        case male, female
    }
    @State var gender: genderType = .male
    var body: some View {
        VStack(spacing: 20) {
            Text("Step2")
            Text("Please select gender")
            Button(action: { gender = .male }) {
                Text("Male")
            }
            Button(action: { gender = .female }) {
                Text("Female")
            }
            Text("Visible to other users and cannot be changed after registration")
            NavigationLink(destination: { UserOnboardingStep3() }) {
                Text("Next")
            }
        }
    }
}

#Preview {
    UserOnboardingStep2()
}
