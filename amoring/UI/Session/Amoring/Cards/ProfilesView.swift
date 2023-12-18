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
    @EnvironmentObject var sessionController: SessionController
    
    @State var isOn = false
    @State var likes: Int = 2
    @State var maxLikes: Int = 4
    
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
                    Spacer()
                    LikesFromMaxView(likes: likes, maxLikes: maxLikes)
                    if sessionController.purchasedLikes > 0 {
                        PurchasedLikesView(likes: sessionController.purchasedLikes)
                    }
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 22)
                .background(Color.gray1000)
                .zIndex(2)
                .transition(.move(edge: .top))
                .onTapGesture {
                    sessionController.openPurchase(purchaseType: .like)
                }
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
                        SwipibleProfileVIew(user: user, swipeAction: $swipeAction, onSwiped: performSwipe, likes: $likes)
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
//                            .opacity(navigator.showDetails ? 0 : 1)
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
    //    fix aligning text
    //    change zindex ? likes/SwipedView/Cards
    private func performSwipe(userProfile: User, hasLiked: Bool) {
            withAnimation {
                navigator.showDetails = false
                navigator.hidePanel = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                removeTopItem()
                if hasLiked {
                    if self.likes > 0 {
                        withAnimation {
                            self.likes -= 1
                        }
                    } else {
                        withAnimation {
                            sessionController.purchasedLikes -= 1
                        }
                    }
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
