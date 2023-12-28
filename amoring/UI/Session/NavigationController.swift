//
//  NavigationController.swift
//  amoring
//
//  Created by 이준녕 on 12/26/23.
//

import Foundation

import SwiftUI
import NavigationStackBackport

class NavigationController: ObservableObject {
    @Published var path = NavigationStackBackport.NavigationPath()
    @Published var selectedConversation: Conversation? = nil
    @Published var selectedBusiness: Business? = nil
    
    @ViewBuilder
    func navigate(screen: NavigatorPath) -> some View {
        switch screen {
        case .listOfLikes:
            PeopleLikesView().environmentObject(self)
        case .conversation:
            ConversationView().environmentObject(self)
        case .business:
            BusinessDetailsView().environmentObject(self)
                }
    }
    
    func toRoot() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
}

enum NavigatorPath: Hashable {
    case listOfLikes
    case conversation
    case business
}
