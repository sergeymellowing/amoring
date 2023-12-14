//
//  ProfilesView.swift
//  amoring
//
//  Created by 이준녕 on 12/6/23.
//

import SwiftUI
import NavigationStackBackport

struct ProfilesView: View {
    @EnvironmentObject var navigator: NavigationAmoringController
    
    @State var isOn = false
    @State var likes: Int = 12
    @State var likes2: Int = 2
    
    @State var swipeAction: SwipeAction = .doNothing
    @State var users: [User] = Dummy.users
    
    //    var onSwiped: (User, Bool) -> ()
    
    
    /// height of bottom bar + padding
    let bottomSpacing = Size.w(75) + Size.w(16)
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if !navigator.hidePanel {
                HStack {
                    CoctailToggle(isOn: $isOn)
                        .onChange(of: isOn) { on in
                            self.users = on ? Dummy.users : []
                        }
                    Spacer()
                    LikesFromMaxView(likes: likes2)
                    LikesLeftView(likes: likes)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 22)
                .background(Color.gray1000)
                .zIndex(2)
                .transition(.move(edge: .top))
            }
            
            ZStack(alignment: .bottom) {
                
                VStack(spacing: 30) {
                    Text("🙈 no more profiles")
                        .font(semiBold16Font)
                        .foregroundColor(.gray400)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        withAnimation {
                            self.users = Dummy.users
                        }
                    }) {
                        Image(systemName: "arrow.clockwise.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .center)
                
                ForEach(users.indices, id: \.self) { index  in
                    let user: User = users[index]
                    
                    if (index == users.count - 1) {
                        SwipibleProfileVIew(user: user, swipeAction: $swipeAction, onSwiped: performSwipe)
                    } else if (index == users.count - 2) {
                        GeometryReader { reader in
                            ZStack {
                                
                                ProfileCardView(user: user,
                                                width: reader.size.width - Size.w(44),
                                                height: reader.size.height - (Size.w(75 + 56))
                                )
                                .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
                            }
                            .frame(width: reader.size.width)
                            .frame(maxHeight: .infinity, alignment: .top)
                            .opacity(navigator.showDetails ? 0 : 1)
                        }
                    }
                }
            }
        }
        //        .padding(.bottom, bottomSpacing)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(.gray1000)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:
                                Text("AMORING")
            .font(bold20Font)
            .foregroundColor(.yellow300)
                            , trailing:
                                Button(action: {
            //                self.users = Dummy.users
            withAnimation {
                navigator.amoring = false
            }
        }) {
            Image("ic-leave-room")
                .resizable()
                .scaledToFit()
                .frame(width: Size.w(32), height: Size.w(32))
        }
        )
        .environmentObject(navigator)
        //        .backport.navigationDestination(for: AmoringPath.self) { screen in
        //            navigator.navigate(screen: screen)
        //        }
    }
    
    private func performSwipe(userProfile: User, hasLiked: Bool) {
        removeTopItem()
        if hasLiked {
            withAnimation {
                self.likes -= 1
            }
        }
        //        onSwiped(userProfile, hasLiked)
    }
    
    private func removeTopItem() {
        users.removeLast()
    }
}

#Preview {
    SessionView()
}

//
//#Preview {
//    ProfilesView()
//}
