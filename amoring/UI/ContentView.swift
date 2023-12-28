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
    @StateObject var sessionController = SessionController()
    @StateObject var messagesController = MessagesController()
    
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
                SessionView().transition(.move(edge: .trailing))
            }
        }
        .overlay(
            sessionController.purchaseType != nil ? PurchaseView(purchaseType: $sessionController.purchaseType, model: purchasesList[sessionController.purchaseType!.rawValue]).transition(.move(edge: .bottom)) : nil
        )
        .environmentObject(navigator)
        .environmentObject(sessionController)
        .environmentObject(sessionManager)
        .environmentObject(userManager)
        .environmentObject(messagesController)
        .onAppear {
            sessionManager.getCurrentSession()
            
            // MARK: TESTS
            userManager.user = Dummy.users.first!
        }
    }
}


#Preview {
    ContentView()
}
