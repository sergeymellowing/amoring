//
//  MessagesController.swift
//  amoring
//
//  Created by 이준녕 on 12/18/23.
//

import SwiftUI

class MessagesController: ObservableObject {
//    @Published var reactions: [Reaction] = []
    @Published var reactions: [Reaction] = Dummy.reactions
    @Published var conversations: [Conversation] = Dummy.conversations
    @Published var alertPresented = false
    
    func delete(id: Int) {
        withAnimation {
            self.conversations.removeAll(where: { $0.id == id })
        }
    }
    
    //TODO: implement this function. Send Conversation to admin
    func report() {
        
    }
}