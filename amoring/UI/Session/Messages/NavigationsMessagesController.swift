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
    @Published var showList: Bool = false
    
    func navigate(screen: MessagesPath) -> some View {
        switch screen {
        case .list: return PeopleLikesView().environmentObject(self)
        }
    }
}

enum MessagesPath: Hashable {
    case list
}
