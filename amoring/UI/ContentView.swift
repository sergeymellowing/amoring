//
//  ContentView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var sessionManager = SessionManager()
    
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
        .environmentObject(sessionManager)
        .onAppear(perform: { sessionManager.getCurrentSession() })
    }
}


#Preview {
    ContentView()
}
