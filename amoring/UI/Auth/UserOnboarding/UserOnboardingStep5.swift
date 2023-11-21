//
//  UserOnboardingStep5.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingStep5: View {
    @State var bio = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step5")
            Text("Lastly, please explain yourself\n(40 characters or less)")
            
            TextField("", text: $bio)

            NavigationLink(destination: { UserOnboardingStep6() }) {
                Text("Next")
            }
        }
    }
}

#Preview {
    UserOnboardingStep5()
}
