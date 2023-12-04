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
    @State var isOn = false
    @State var likes: Int = 12
    @State var likes2: Int = 2
    
    let user: User = User(id: "asdasdsa", name: "Eugene")
    // height of bottom bar + padding inside bottom bar + padding
    let bottomSpacing = Size.h(55 + 18 + 16)
    
    var body: some View {
        NavigationStackBackport.NavigationStack(path: $navigator.path) {
            VStack(spacing: 0) {
                HStack {
                    CoctailToggle(isOn: $isOn)
                    Spacer()
                    LikesFromMaxView(likes: likes2)
                    LikesLeftView(likes: likes)
                }.padding(.vertical, 16)
                
                ProfileCardView(user: user)
            }
            .padding(.horizontal, 22)
            .padding(.bottom, bottomSpacing)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(.gray1000)
            .navigationBarItems(leading:
                                    Text("AMORING")
                .font(bold20Font)
                .foregroundColor(.yellow300)
                                , trailing:
                                    Button(action: {}) {
                Image("ic-leave-room")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            }
            )
            .environmentObject(navigator)
            .backport.navigationDestination(for: AmoringPath.self) { screen in
                navigator.navigate(screen: screen)
            }
        }
    }
}

#Preview {
    AmoringView()
}
