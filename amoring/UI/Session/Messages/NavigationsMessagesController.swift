//
//  NavigationsMessagesController.swift
//  amoring
//
//  Created by 이준녕 on 12/18/23.
//

import SwiftUI
import NavigationStackBackport

class NavigationsMessagesController: ObservableObject {
    @Published var path = NavigationStackBackport.NavigationPath()
//    @Published var reactions: [Reaction] = []
    @Published var reactions: [Reaction] = Dummy.reactions
    
    @ViewBuilder
    func navigate(screen: MessagesPath) -> some View {
        switch screen {
        case .list: 
            PeopleLikesView().environmentObject(self)
        case .conversation: 
            ConversationView().environmentObject(self)
                }
    }
    
    func toRoot() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}

enum MessagesPath: Hashable {
    case list
    case conversation
}
