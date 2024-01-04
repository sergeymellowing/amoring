//
//  UserOnboardingView.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI
import NavigationStackBackport

struct UserOnboardingView: View {
    @StateObject var controller: UserOnboardingController = UserOnboardingController()
    @Binding var goToUserOnboarding: Bool
    
    var body: some View {
        NavigationStackBackport.NavigationStack {
            ZStack {
                UserOnboardingName(goToUserOnboarding/: $goToUserOnboarding)
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .environmentObject(controller)
    }
}

class UserOnboardingController: ObservableObject {
    @Published var user: User = User(id: 99, interests: [])
}

#Preview {
    UserOnboardingView(goToUserOnboarding: .constant(true))
}
