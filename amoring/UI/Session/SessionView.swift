//
//  SessionView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI

struct SessionView: View {
    @StateObject var userManager = UserManager()
    @StateObject var sessionController = SessionController()
    
    var body: some View {
        ZStack {
            NavigatorView { index in
                getTabView(index: index)
            }
            .overlay(
                sessionController.purchaseType != nil ? PurchaseView(purchaseType: $sessionController.purchaseType, model: purchasesList[sessionController.purchaseType!.rawValue]).transition(.move(edge: .bottom)) : nil
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .environmentObject(userManager)
        .environmentObject(sessionController)
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
