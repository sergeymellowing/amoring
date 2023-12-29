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
                    ZStack {
                        LogoLoadingView()
                        
                        if !sessionManager.isLoading {
                            SignInSheet(goToUserOnboarding: $goToUserOnboarding).environmentObject(navigator)
                        }
                    }
                    .navigationBarItems(leading:
                        Text("AMORING")
                            .font(bold20Font)
                            .foregroundColor(.yellow300)
                            .opacity(sessionManager.isLoading ? 0 : 1)
                    )
                    .backport.navigationDestination(for: AuthPath.self) { screen in
                        navigator.navigate(screen: screen)
                    }
                }
            }
        }
    }
}
        create tooltips for every SNS
                        remove animation for bg
                        
#Preview {
    SignInView()
}
