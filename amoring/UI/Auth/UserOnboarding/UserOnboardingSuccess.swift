//
//  UserOnboardingStep7.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingSuccess: View {
    @EnvironmentObject var sessionManager: SessionManager
    var body: some View {
        VStack(spacing: 20) {
            Text("Step7")
            Text("SUCCESS!")
            
            Button(action: {
                withAnimation {
                    sessionManager.signedIn = true
                    // user onb finished
                }
                
            }) {
                Text("Next")
            }
        }
    }
}

#Preview {
    UserOnboardingSuccess()
}
