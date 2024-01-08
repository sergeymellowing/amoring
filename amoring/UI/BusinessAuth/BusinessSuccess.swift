//
//  BusinessSuccess.swift
//  amoring
//
//  Created by 이준녕 on 11/22/23.
//

import SwiftUI

struct BusinessSuccess: View {
    @EnvironmentObject var sessionManager: SessionManager
    var body: some View {
        VStack(spacing: 20) {
            Text("SUCCESS!")
            
            Button(action: {
                withAnimation {
                    sessionManager.BusinessSignedIn = true
                    // user onb finished
                }
            }) {
                Text("Next")
            }
        }
        .padding(16)
    }
}

#Preview {
    BusinessSuccess()
}
