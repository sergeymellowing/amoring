//
//  SessionController.swift
//  amoring
//
//  Created by 이준녕 on 12/18/23.
//

import SwiftUI

class SessionController: ObservableObject {
    @Published var purchaseType: PurchaseModel.type? = nil
    
    
    func openPurchase(purchaseType: PurchaseModel.type) {
        withAnimation {
            self.purchaseType = purchaseType
        }
    }
}
