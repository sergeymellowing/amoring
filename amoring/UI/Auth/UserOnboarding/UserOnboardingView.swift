//
//  UserOnboardingView.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingView: View {
    @StateObject var controller: UserOnboardingController = UserOnboardingController()
    
    var body: some View {
        NavigationView {
            UserOnboardingName()
           
//                .onChange(of: user) { changed in
//                    print(changed)
//                }
        }
        .environmentObject(controller)
    }
}

class UserOnboardingController: ObservableObject {
    @Published var user: User = User()
}

#Preview {
    UserOnboardingView()
}
