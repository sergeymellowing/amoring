//
//  UserOnboardingView.swift
//  amoring
//
//  Created by 이준녕 on 11/21/23.
//

import SwiftUI

struct UserOnboardingView: View {
    @State var user: User = User()
    
    var body: some View {
        NavigationView {
            UserOnboardingName(user: user)
        }
    }
}

#Preview {
    UserOnboardingView()
}
