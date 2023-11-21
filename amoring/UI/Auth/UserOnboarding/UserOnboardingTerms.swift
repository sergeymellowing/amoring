//
//  UserOnboardingStep6.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingTerms: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Step6")
            Text("TERMS and AGREEMENTS")
            
            NavigationLink(destination: { UserOnboardingSuccess() }) {
                Text("Next")
            }
        }
    }
}

#Preview {
    UserOnboardingTerms()
}
