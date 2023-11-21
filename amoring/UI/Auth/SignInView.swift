//
//  SignInView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var goToUserOnboarding = false
    
    var body: some View {
        ZStack {
            if goToUserOnboarding {
                UserOnboardingView()
                    .transition(.move(edge: .trailing))
            } else {
                NavigationView {
                    VStack(alignment: .center, spacing: 20) {
                        Spacer()
                        
                        // TODO: get user from db if exists and skip useronboarding part else go to userOnboarding
                        HStack(spacing: 20) {
                            Button(action: goNext) {
                                Text("Facebook")
                            }
                            Button(action: goNext) {
                                Text("Google")
                            }
                            Button(action: goNext) {
                                Text("Apple")
                            }
                        }
                        
                        HStack(spacing: 20) {
                            Button(action: goNext) {
                                Text("Naver")
                            }
                            Button(action: goNext) {
                                Text("Kakao")
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: {
                                BusinessSignInView()
                        }) {
                            Text("Go To Business Sign In")
                        }
                    }
                }
            }
        }
    }
    
    private func goNext() {
//        if user.exists {
//            go to session
//        } else {
        withAnimation {
            goToUserOnboarding = true
        }
//        }
    }
}

#Preview {
    SignInView()
}
