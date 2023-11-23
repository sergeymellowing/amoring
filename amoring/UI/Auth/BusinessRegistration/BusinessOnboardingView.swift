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
                    TextField("Name", text: $business.name ?? "")
                    TextField("Address", text: $business.address ?? "")
                    TextField("Type", text: $business.type ?? "")
                    TextField("Representative", text: $business.representative ?? "")
                    TextField("Contact", text: $business.contact ?? "")
                    TextField("Company Registration Number", text: $business.number ?? "")
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
