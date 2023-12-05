//
//  AccountView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    var body: some View {
        VStack(spacing: 30) {
            Text("AccountView")
            Button(action: {
                withAnimation {
                    sessionManager.signedIn = false
                    sessionManager.isBusiness = false
                }
            }) {
                Text("LOGOUT")
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray1000)
    }
}

#Preview {
    AccountView()
}
