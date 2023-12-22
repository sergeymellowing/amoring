//
//  SignInView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI
import NavigationStackBackport

struct SignInView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @StateObject var navigator = NavigationAuthController()
    
    @State var goToUserOnboarding = false
    
    var body: some View {
        ZStack {
            if goToUserOnboarding {
                UserOnboardingView()
                    .transition(.move(edge: .trailing))
            } else {
                NavigationStackBackport.NavigationStack(path: $navigator.path) {
                    VStack(alignment: .center, spacing: 20) {
                        Spacer()
                        
                        // TODO: get user from db if exists and skip useronboarding part else go to userOnboarding
                        HStack(spacing: 20) {
                            Button(action: goNext) {
                                Text("Facebook")
                            }
                            ThirdPartyProvider.shared.googleButton()
                            ThirdPartyProvider.shared.appleButton()
                        }
                        
                        HStack(spacing: 20) {
                            Button(action: goNext) {
                                Text("Naver")
                            }
                            ThirdPartyProvider.shared.kakaoButton()
                        }
                        
                        Button(action: {
                            sessionManager.isBusiness = false
                            sessionManager.signedIn = true
                        }) {
                            Text("SESSION")
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            navigator.toBusinessSignIn()
                        }) {
                            Text("Go To Business Sign In")
                        }
                    }
                    .backport.navigationDestination(for: AuthPath.self) { screen in
                        navigator.navigate(screen: screen)
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
