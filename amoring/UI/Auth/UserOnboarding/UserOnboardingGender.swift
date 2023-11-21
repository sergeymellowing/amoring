//
//  UserOnboardingStep2.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingGender: View {
    @State private var gender: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step2")
            Text("Please select gender")
            
            Picker("", selection: $gender) {
                ForEach(Constants.genderOptions, id: \.self) {
                    Text(LocalizedStringKey($0)).tag($0)
                }
            }
                    .pickerStyle(.segmented).frame(maxWidth: .infinity)
            
            Text("Visible to other users and cannot be changed after registration")
            NavigationLink(destination: { UserOnboardingAge() }) {
                Text("Next")
            }
        }
        .padding(16)
    }
}

#Preview {
    UserOnboardingGender()
}
