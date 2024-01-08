//
//  BusinessTermsView.swift
//  amoring
//
//  Created by 이준녕 on 11/22/23.
//

import SwiftUI

struct BusinessTermsView: View {
    @State var terms: Bool = false
    @State var goToPlans: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Step6")
            Text("TERMS and AGREEMENTS")
            
            Toggle(isOn: $terms) {
                Text("I agree with terms")
            }

            NavigationLink(isActive: $goToPlans, destination: {
                PlansView()
            }) {
                EmptyView()
            }
            
            Button(action: {
                goToPlans = true
            }) {
                Text("Next")
            }
            .disabled(!terms)
            .opacity(terms ? 1 : 0.5)
        }
        .padding(16)
    }
}

#Preview {
    BusinessTermsView()
}
