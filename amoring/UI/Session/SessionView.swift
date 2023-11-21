//
//  SessionView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct SessionView: View {
    var body: some View {
        ZStack {
            NavigatorView { index in
                getTabView(index: index)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    @ViewBuilder
    func getTabView(index: Int) -> some View {
        let type = TabBarType(rawValue: index) ?? .amoring
        
        switch type {
        case .nearby :
            NearbyView()
        case .amoring:
            AmoringView()
        case .messages:
            MessagesView()
        case .account:
            AccountView()
        }
    }
}

#Preview {
    SessionView()
}
