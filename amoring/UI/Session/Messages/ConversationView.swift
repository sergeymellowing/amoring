//
//  ConversationView.swift
//  amoring
//
//  Created by 이준녕 on 12/19/23.
//

import SwiftUI
import Combine

struct ConversationView: View {
    @EnvironmentObject var navigator: NavigationController
    @EnvironmentObject var sessionController: SessionController
    @EnvironmentObject var userManager: UserManager
    
    @State var conversation: Conversation = Dummy.conversations.first!
    
    @State var newMessage = ""
    
    var body: some View {
        let companion = conversation.participants.first!
        let url = companion.pictures?.first ?? ""
        
        VStack(spacing: 0) {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack {
                        header()
                        
                        if conversation.messages.isEmpty {
                            VStack {
                                Image("wine-two")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: Size.w(90), height: Size.w(90))
                                
                                Text("메시지를 시작할 수 있어요!")
                                    .font(medium22Font)
                                
                                Text("서로 좋아요한 상대방과\n이제부터 여기서 메시지를 보낼 수 있어요.\n먼저 메시지를 보내보세요!")
                                    .font(medium16Font)
                                    .lineSpacing(6)
                                    .multilineTextAlignment(.center)
                            }
                        } else {
                            ForEach(conversation.messages, id: \.self) { message in
                                MessageView(message: message)
                                    .id(message.id)
                            }
                        }
                        
                    }
                    .padding(.top, Size.w(30))
                    .onReceive(Just(conversation.messages)) { _ in
                        withAnimation {
                            proxy.scrollTo(conversation.messages.last?.id, anchor: .bottom)
                        }
                        
                    }.onAppear {
                        withAnimation {
                            proxy.scrollTo(conversation.messages.last?.id, anchor: .bottom)
                        }
                    }
                }
                
                VStack {
                    Divider()
                    
                    ZStack {
                        HStack {
                            TextField("메세지를 입력하세요.", text: $newMessage)
                                .onSubmit {
                                    sendMessage(action: {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                            withAnimation {
                                                proxy.scrollTo(conversation.messages.last?.id, anchor: .bottom)
                                            }
                                        }
                                    })
                                }
                            
                            Button(action: {
                                sendMessage(action: {
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        withAnimation {
                                            proxy.scrollTo(conversation.messages.last?.id, anchor: .bottom)
                                        }
                                    }
                                })
                            }) {
                                Image("send-button")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: Size.w(24), height: Size.w(24))
                            }
                        }
                    }
                    .padding(.horizontal, Size.w(19))
                    .padding(.vertical, Size.w(12))
                    .background(Color.gray900)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
                    .overlay(
                        RoundedRectangle(cornerRadius: 25).stroke(Color.gray800)
                    )
                    .padding(.horizontal, Size.w(22))
                    .padding(.bottom, Size.w(12))
                    .padding(.top, Size.w(10))
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray1000)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(companion.name ?? "")
                    .font(medium20Font)
                    .foregroundColor(.yellow300)
            }
        }
        .navigationBarItems(leading:
                                Button(action: navigator.toRoot) {
            Image(systemName: "chevron.left")
                .resizable()
                .scaledToFit()
                .frame(width: Size.w(20), height: Size.w(20))
                .foregroundColor(.yellow300)
        }
        )
    }
    
    func sendMessage(action: () -> Void) {
//        - doesn't work for second messaege
//        - need to move all navigation out or hide bottom bar?
        if !newMessage.isEmpty {
            withAnimation {
                conversation.messages.append(Message(id: Int.random(in: 99..<99999), body: newMessage, sender: userManager.user, senderId: userManager.user?.id ?? 0, recipients: [], createdAt: Date(), updatedAt: Date()))
                newMessage = ""
                    action()
            }
        }
    }
    
    @ViewBuilder
    func header() -> some View {
        let companion = conversation.participants.first!
        let url = companion.pictures?.first ?? ""
        
        VStack {
            AsyncImage(url: URL(string: url), content: { image in
                image
                    .resizable()
                    .scaledToFill()
            }, placeholder: {ProgressView()})
            .frame(width: Size.w(64), height: Size.w(64))
            .clipShape(Circle())
            
            VStack(spacing: 10) {
                Text("강남, Channel")
                    .foregroundColor(.yellow300)
                + Text(" 에서")
                    .foregroundColor(.gray500)
                
                Text("1분전")
                    .foregroundColor(.yellow300)
                + Text(" 에 메시지가 활성화 되었습니다.")
                    .foregroundColor(.gray500)
            }
            .font(regular14Font)
            .padding(.bottom, Size.w(15))
            
            Divider()
                .padding(.bottom, Size.w(50))
        }
    }
}

struct MessageView: View {
    @EnvironmentObject var userManager: UserManager
    let message: Message
    
    var body: some View {
        let isOwner = message.senderId == userManager.user?.id
        
        if isOwner {
            HStack(alignment: .bottom) {
                Text(message.createdAt.toTime())
                    .font(light12Font)
                    .foregroundColor(.gray400)
                Text(message.body)
                    .foregroundColor(.gray900)
                    .padding()
                    .background(Color.yellow200)
                    .cornerRadius(16, corners: [.bottomLeft, .topLeft, .topRight])
            }
            .padding(.horizontal, Size.w(22))
            .padding(.leading, Size.w(20))
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.bottom, Size.w(12))
        } else {
            HStack(alignment: .bottom) {
                Text(message.body)
                    .foregroundColor(.gray900)
                    .padding()
                    .background(Color.gray150)
                    .cornerRadius(16, corners: [.bottomRight, .topLeft, .topRight])
                    
                Text(message.createdAt.toTime())
                    .font(light12Font)
                    .foregroundColor(.gray400)
            }
            .padding(.horizontal, Size.w(22))
            .padding(.leading, Size.w(20))
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, Size.w(12))
        }
    }
}


#Preview {
    ConversationView(conversation: Dummy.conversations.first!)
}
