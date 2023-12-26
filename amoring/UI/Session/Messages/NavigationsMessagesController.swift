//
//  NavigationsMessagesController.swift
//  amoring
//
//  Created by 이준녕 on 12/18/23.
//

import SwiftUI

class MessagesController: ObservableObject {
//    @Published var reactions: [Reaction] = []
    @Published var reactions: [Reaction] = Dummy.reactions
}
