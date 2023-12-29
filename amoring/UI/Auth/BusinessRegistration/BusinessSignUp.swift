//
//  BusinessSignUp.swift
//  amoring
//
//  Created by 이준녕 on 11/22/23.
//

import SwiftUI

struct BusinessSignUp: View {
    @EnvironmentObject var sessionManager: SessionManager
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            CustomTextField(text: $email)
                
            CustomSecureField(text: $password)
                
            Spacer()
            
            NavigationLink(destination: {
                OTPView()
            }) {
                Text("Next")
            }
            
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    BusinessSignUp()
}
