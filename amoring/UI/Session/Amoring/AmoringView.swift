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
    
    @State var swipeAction: SwipeAction = .doNothing
    @State var users: [User] = [
        User(id: "1", name: "Eugene Krabs", fakeImage: "person-0"),
        User(id: "2", name: "SpongeBob SquarePants", fakeImage: "person-1"),
        User(id: "3", name: "Patric Star", fakeImage: "person-2"),
        User(id: "4", name: "Squidward", fakeImage: "person-3"),
        User(id: "5", name: "Sandy Cheeks", fakeImage: "person-4"),
//        User(id: "6", name: "Eugene Krabs", fakeImage: "person-0")
    ]
    
//    var onSwiped: (User, Bool) -> ()
    
    /// height of bottom bar + padding inside bottom bar + padding
    let bottomSpacing = Size.safeArea().bottom + Size.h(18 + 16)
    
    var body: some View {
        NavigationStackBackport.NavigationStack(path: $navigator.path) {
            VStack(spacing: 0) {
                HStack {
                    CoctailToggle(isOn: $isOn)
                    Spacer()
                    LikesFromMaxView(likes: likes2)
                    LikesLeftView(likes: likes)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 22)
                .background(Color.gray1000)
                .zIndex(2)
                
                ZStack(alignment: .bottom) {
                    VStack {
                        Text("🙈 no-more-profiles")
                            .font(semiBold16Font)
                            .foregroundColor(.gray400)
                            .multilineTextAlignment(.center)
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                    ForEach(users.indices, id: \.self){ index  in
                        let user: User = users[index]
                        
                        if(index == users.count - 1){
                            SwipibleProfileVIew(user: user, swipeAction: $swipeAction, onSwiped: performSwipe)
                        } else if(index == users.count - 2){
                            ProfileCardView(user: user)
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
                                        .foregroundColor(.yellow200)
                                }
                            }
                        }
                        .padding(.horizontal, Size.w(44 + 22))
                        .zIndex(2)
                    }
                }
            }
            .padding(.bottom, bottomSpacing)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            .background(.gray1000)
            .navigationBarItems(leading:
                                    Text("AMORING")
                .font(bold20Font)
                .foregroundColor(.yellow300)
                                , trailing:
                                    Button(action: {
                self.users = [
                    User(id: "1", name: "Eugene Krabs", fakeImage: "person-0"),
                    User(id: "2", name: "SpongeBob SquarePants", fakeImage: "person-1"),
                    User(id: "3", name: "Patric Star", fakeImage: "person-2"),
                    User(id: "4", name: "Squidward", fakeImage: "person-3"),
                    User(id: "5", name: "Sandy Cheeks", fakeImage: "person-4"),
//                    User(id: "6", name: "Eugene Krabs", fakeImage: "person-0"),
                ]
            }) {
                Image("ic-leave-room")
                    .resizable()
                    .scaledToFit()
                    .frame(width: Size.w(32), height: Size.w(32))
            }
            )
            .environmentObject(navigator)
            .backport.navigationDestination(for: AmoringPath.self) { screen in
                navigator.navigate(screen: screen)
            }
        }
    }
    
    private func performSwipe(userProfile: User, hasLiked: Bool) {
        removeTopItem()
//        onSwiped(userProfile, hasLiked)
    }
    
    private func removeTopItem(){
        users.removeLast()
    }
}

#Preview {
    SessionView()
}
