//
//  UserOnboardingTerms.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingTerms: View {
    @EnvironmentObject var controller: UserOnboardingController
    @State var goToSuccess = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step6")
            Text("TERMS and AGREEMENTS")
            
            Toggle(isOn: $controller.user.terms ?? false) {
                Text("I agree with terms")
            }

            NavigationLink(isActive: $goToSuccess, destination: {
                UserOnboardingSuccess()
            }) {
                EmptyView()
            }
            
            Button(action: {
                goToSuccess = true
            }) {
                Text("Next")
            }
            .disabled(!(controller.user.terms ?? false))
            .opacity((controller.user.terms ?? false) ? 1 : 0.5)
        }
        .padding(16)
    }
}

//#Preview {
//    UserOnboardingTerms()
//}
