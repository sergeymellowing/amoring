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
            //        BusinessSessionView()
                    if sessionManager.isLoading {
                        ProgressView()
                    } else if !sessionManager.signedIn {
                        SignInView().environmentObject(sessionManager)
                    } else if sessionManager.isBusiness {
                        BusinessSessionView()
                    } else {
                        /// pass user here
                        SessionView().environmentObject(sessionManager).transition(.move(edge: .trailing))
                    }
        }
        .onAppear(perform: { sessionManager.getCurrentSession() })
    }
}


#Preview {
    ContentView()
}
