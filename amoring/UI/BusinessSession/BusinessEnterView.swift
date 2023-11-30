//
//  BusinessEnterView.swift
//  amoring
//
//  Created by 이준녕 on 11/23/23.
//

import SwiftUI

struct BusinessEnterView: View {
    @Binding var isLocked: Bool
    @State var password = ""
    @State var warning = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("LOGO")
            Text("To change settings Please re-enter your password")
            Text("admin@pumpkin.com")
            SecureField("", text: $password)
                .textFieldStyle(.roundedBorder)
                
            
            Text("Wrong password!")
                .foregroundColor(.red)
                .opacity(warning ? 1 : 0)
            
            Spacer()
            Button(action: {
                if password == "12345678" {
                    withAnimation {
                        isLocked = false
                    }
                } else {
                    warning = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        warning = false
                    }
                }
            }) {
                Text("Done")
            }
        }
    }
}

#Preview {
    BusinessEnterView(isLocked: .constant(false))
}
