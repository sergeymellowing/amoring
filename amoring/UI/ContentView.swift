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
        if sessionManager.isLoading {
            ProgressView()
        } else if !sessionManager.signedIn {
            SignInView().environmentObject(sessionManager)
        } else {
            /// pass user here
            SessionView().environmentObject(sessionManager).transition(.move(edge: .trailing))
        }
    }
}


#Preview {
    ContentView()
}
