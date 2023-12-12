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
    @State var showDetails = false
    @State var animateView = false
    //    var onSwiped: (User, Bool) -> ()
    
    @Namespace var animation
    /// height of bottom bar
    //    let bottomSpacing = Size.w(75)
    let bottomSpacing = Size.w(75 + 16)
    
    var body: some View {
        GeometryReader { reader in
            ZStack {
                VStack(alignment: .center, spacing: 0) {
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
                                SwipibleProfileVIew(user: user, swipeAction: $swipeAction, animation: animation, onSwiped: performSwipe)
                                    .matchedGeometryEffect(id: user.id, in: animation)
                                    .scaleEffect(navigator.selectedUser == nil ? 1 : 1.07)
                                    .onTapGesture {
                                        withAnimation {
                                            navigator.selectedUser = user
                                            showDetails = true
                                            //                                            navigator.selectedUser = navigator.selectedUser == user ? nil : user
                                            //                                            showDetails.toggle()
                                        }
                                    }
                            } else if (index == users.count - 2) {
                                let size = CGSize(width: reader.size.width - Size.w(44), height: reader.size.height)
                                ZStack(alignment: .top) {
                                    ProfileCardView(user: user, animation: animation, size: size)
                                        .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
                                        .padding(.bottom, Size.w(40))
                                }.frame(maxWidth: .infinity)
                                //                                    .opacity(navigator.selectedUser == nil && showDetails ? 0 : 1)
                            }
                        }
                        
                        
                        if !self.users.isEmpty {
                            HStack {
                                Button(action: {
                                    swipeAction = .swipeLeft
                                }) {
                                    ZStack {
                                        Circle().frame(width: Size.w(76), height: Size.w(76))
                                            .foregroundColor(.gray900)
                                        Image("dislike-cross")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: Size.w(29), height: Size.w(29))
                                    }
                                }
                                
                                Spacer()
                                
                                Button(action: {
                                    swipeAction = .swipeRight
                                }) {
                                    ZStack {
                                        Circle().frame(width: Size.w(76), height: Size.w(76))
                                            .foregroundColor(.gray900)
                                        Image("ic-heart-fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: Size.w(34), height: Size.w(30))
                                            .foregroundColor(.yellow300)
                                    }
                                }
                            }
                            .padding(.horizontal, Size.w(44 + 22))
                            .zIndex(2)
                        }
                    }
                    .padding(.bottom, bottomSpacing)
                }
                //                if let user = navigator.selectedUser, showDetails {
                //                    ScrollView {
                //                        VStack(spacing: 0) {
                //                            let size = CGSize(width: reader.size.width - Size.w(20), height: reader.size.height)
                //                            ProfileCardView(user: user, animation: animation, size: size)
                //                                .matchedGeometryEffect(id: user.id, in: animation)
                //                            Color.green.frame(width:300, height: 900)
                //                        }
                //                        .padding(.horizontal, Size.w(10))
                //                            .transition(.identity)
                //                    }
                //                    .background(.gray1000)
                //                    //
                //
                //                    .onTapGesture {
                //                        withAnimation {
                //                            navigator.selectedUser = nil
                //                            showDetails.toggle()
                //                        }
                //                    }
                //                }
            }
            .overlay(
                navigator.selectedUser != nil && showDetails ?
                ScrollView(showsIndicators: false) {
                    ZStack(alignment: .top) {
                        VStack(spacing: 0) {
                            let size = CGSize(width: reader.size.width - Size.w(20), height: reader.size.height)
                            
                            ProfileCardView(user: navigator.selectedUser!, animation: animation, size: size)
                                .matchedGeometryEffect(id: navigator.selectedUser!.id, in: animation)
                                .transition(.identity)
                                .scaleEffect(animateView ? 1 : 0.9)
                            
                            Color.yellow350.frame(height: 600)
                        }
                        .cornerRadius(24, corners: [.bottomLeft, .bottomRight])
                        .padding(.horizontal, Size.w(10))
                    }.frame(maxWidth: .infinity)
                        .padding(.bottom, bottomSpacing)
                }
                    .background(.gray1000)
                    .onTapGesture {
                        withAnimation {
                            navigator.selectedUser = nil
                            showDetails.toggle()
                        }
                    }
                    .onAppear {
                        withAnimation {
                            animateView = true
                        }
                    }
                : nil
            )
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
    SessionView().environmentObject(NavigationAmoringController())
}
