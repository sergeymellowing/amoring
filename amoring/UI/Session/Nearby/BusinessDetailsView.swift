//
//  BusinessDetailsView.swift
//  amoring
//
//  Created by 이준녕 on 12/28/23.
//

import SwiftUI

struct BusinessDetailsView: View {
    @EnvironmentObject var navigator: NavigationController
    
    var body: some View {
        if let business = navigator.selectedBusiness {
            Text(business.name ?? "noname")
        }
    }
}

#Preview {
    BusinessDetailsView()
}
