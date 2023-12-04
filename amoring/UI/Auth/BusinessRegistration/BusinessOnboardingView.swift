//
//  BusinessOnboardingView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct BusinessOnboardingView: View {
    @State var business: Business = Business()
    
    var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    CustomTextField("Name", text: $business.name ?? "")
                    CustomTextField("Address", text: $business.address ?? "")
                    CustomTextField("Type", text: $business.type ?? "")
                    CustomTextField("Representative", text: $business.representative ?? "")
                    CustomTextField("Contact", text: $business.contact ?? "")
                    CustomTextField("Company Registration Number", text: $business.number ?? "")
                    Button(action: {}) {
                        Text("upload business reg photo")
                    }
                    Button(action: {}) {
                        Text("upload images")
                    }
                    
                    NavigationLink(destination: {
                        BusinessTermsView()
                    }) {
                        Text("Next")
                    }
                    
                }
                .padding(16)
        }
    }
}

#Preview {
    BusinessOnboardingView()
}
