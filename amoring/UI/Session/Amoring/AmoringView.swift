//
//  AmoringView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI
import NavigationStackBackport

struct AmoringView: View {
    @StateObject var navigator = NavigationAmoringController()

    var body: some View {
        NavigationStackBackport.NavigationStack(path: $navigator.path) {
            Group {
                if navigator.amoring {
                    ProfilesView()
                } else {
                    CheckInView()
                }
            }
            .environmentObject(navigator)
        }
    }
}

#Preview {
    SessionView()
}
