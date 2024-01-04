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
    @State var animate = false
    
    var body: some View {
        ZStack {
            if goToUserOnboarding {
                UserOnboardingView()
                    .transition(.move(edge: .trailing))
            } else {
                NavigationStackBackport.NavigationStack(path: $navigator.path) {
                    ZStack {
                        LogoLoadingView(animation1: true, animation2: true, animation3: true, animation4: true, animation5: true)
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    withAnimation(.smooth) {
                                        animate = true
                                    }
                                }
                            }
                        
                        ZStack(alignment: .topLeading) {
                            if animate {
                                SignInSheet(goToUserOnboarding: $goToUserOnboarding).environmentObject(navigator)
                            }
                            if animate {
                                Text("AMORING")
                                    .font(bold20Font)
                                    .foregroundColor(.yellow300)
                                    .frame(height: 44, alignment: .center)
                                    .padding(.horizontal, Size.w(22))
                            }
                        }
                    }
                    //                    .navigationBarItems(leading:
                    //                        Text("AMORING")
                    //                            .font(bold20Font)
                    //                            .foregroundColor(.yellow300)
                    //                            .opacity(sessionManager.isLoading ? 0.01 : 1)
                    //                    )
                    .backport.navigationDestination(for: AuthPath.self) { screen in
                        navigator.navigate(screen: screen)
                    }
                }
            }
        }
    }
}

#Preview {
    SignInView()
}
