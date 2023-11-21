//
//  UserOnboardingStep3.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingStep3: View {
    @State var selection: Int = 30
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step3")
            Text("Please enter your age")
            
            Picker("", selection: $selection) {
                ForEach(18...100, id: \.self) {
                    Text(String($0))
                }
            }
            .pickerStyle(InlinePickerStyle())

            Text("Visible to other users and cannot be changed after registration")
            NavigationLink(destination: { UserOnboardingStep4() }) {
                Text("Next")
            }
        }
    }
}

#Preview {
    UserOnboardingStep3()
}
