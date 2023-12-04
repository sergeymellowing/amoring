//
//  OTPView.swift
//  amoring
//
//  Created by 이준녕 on 11/22/23.
//

import SwiftUI

struct OTPView: View {
    @State var otp = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            CustomTextField("", text: $otp)
                
            Spacer()
            
            NavigationLink(destination: {
                BusinessOnboardingView()
            }) {
                Text("Done")
            }
            
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    OTPView()
}
