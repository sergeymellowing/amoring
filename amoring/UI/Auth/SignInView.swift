//
//  SignInView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject var sessionManager: SessionManager
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("SIGN IN VIEW")
            
            Button(action: {
                Task {
                await sessionManager.signIn()
                }
            }) {
                Text("Sign in")
            }
        }
        .padding()
    }
}

#Preview {
    SignInView()
}
