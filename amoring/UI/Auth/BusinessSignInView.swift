//
//  BusinessSignIn.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct BusinessSignInView: View {
    @EnvironmentObject var sessionManager: SessionManager
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            CustomTextField(text: $email)
            CustomSecureField(text: $password)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    sessionManager.isBusiness = true
                    sessionManager.signedIn = true
                }
            }) {
                Text("Business sign in")
            }
            
            Spacer()
            
            NavigationLink(destination: {
                BusinessSignUp()
            }) {
                Text("Business sign Up")
            }
        }
        .padding(16)
    }
}

#Preview {
    BusinessSignInView()
        .preferredColorScheme(.dark)
}
