//
//  UserOnboardingSuccess.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingSuccess: View {
    @EnvironmentObject var sessionManager: SessionManager
    @EnvironmentObject var userManager: UserManager
    @EnvironmentObject var controller: UserOnboardingController
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step7")
            Text("SUCCESS!")
            
            Button(action: {
//                save user to db
                print(controller.user)
                userManager.user = controller.user
                withAnimation {
                    sessionManager.isBusiness = false
                    sessionManager.signedIn = true
                    // user onb finished
                }
                
            }) {
                Text("Next")
            }
        }
        .padding(16)
    }
}

//#Preview {
//    UserOnboardingSuccess()
//}
