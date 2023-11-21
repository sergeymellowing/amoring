//
//  BusinessSignIn.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct BusinessSignInView: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("", text: $email)
            SecureField("", text: $password)
            
            Spacer()
            
            Button(action: {
                // business sign in
            }) {
                Text("Business sign in")
            }
            
            Spacer()
            
            Button(action: {
                // navigate to business sign up
            }) {
                Text("Business sign Up")
            }
        }
    }
}

#Preview {
    BusinessSignInView()
}
