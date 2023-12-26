//
//  ContentView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI
import NavigationStackBackport

struct ContentView: View {
    @StateObject var sessionManager = SessionManager()
    @StateObject var userManager = UserManager()
    @StateObject var navigator = NavigationController()
    
    var body: some View {
        ZStack {
            if sessionManager.isLoading {
                ProgressView()
            } else if !sessionManager.signedIn {
                SignInView()
            } else if sessionManager.isBusiness {
                BusinessSessionView().transition(.move(edge: .trailing))
            } else {
                /// pass user here
                NavigationStackBackport.NavigationStack(path: $navigator.path) {
                    SessionView().transition(.move(edge: .trailing))
                        .environmentObject(navigator)
                        .backport.navigationDestination(for: NavigatorPath.self) { screen in
                            navigator.navigate(screen: screen)
                        }
                }
            }
        }
        .environmentObject(sessionManager)
        .environmentObject(userManager)
        .onAppear(perform: { sessionManager.getCurrentSession() })
        
        .onAppear {
            // MARK: TESTS
            userManager.user = Dummy.users.first!
        }
    }
}


#Preview {
    ContentView()
}
