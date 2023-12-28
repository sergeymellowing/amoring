//
//  ConversationView.swift
//  amoring
//
//  Created by 이준녕 on 12/19/23.
//

import SwiftUI
import Combine

struct ConversationView: View, KeyboardReadable {
    @EnvironmentObject var navigator: NavigationController
    @EnvironmentObject var sessionController: SessionController
    @EnvironmentObject var userManager: UserManager
    
    @State var newMessage = ""
    
    var body: some View {
        if let conversation = navigator.selectedConversation {
            let messages = conversation.messages
            let companion = conversation.participants.first!
            let url = companion.pictures?.first ?? ""
            
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    ScrollView {
                        header()
                        
                        if messages.isEmpty {
                            VStack(spacing: Size.w(15)) {
                                Image("wine-two")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: Size.w(90), height: Size.w(90))
                                
                                Text("메시지를 시작할 수 있어요!")
                                    .font(medium22Font)
                                    .foregroundColor(.gray500)
                                
                                Text("서로 좋아요한 상대방과\n이제부터 여기서 메시지를 보낼 수 있어요.\n먼저 메시지를 보내보세요!")
                                    .font(medium16Font)
                                    .foregroundColor(.gray600)
                                    .lineSpacing(6)
                                    .multilineTextAlignment(.center)
                            }
                        } else {
                            ForEach(messages, id: \.self) { message in
                                MessageView(message: message)
                                    .id(message.id)
                            }
    //                        EmptyView().id("bottom")
                        }
                    }
                    
                    .onAppear {
                        withAnimation {
                            proxy.scrollTo(messages.last?.id, anchor: .bottom)
                        }
                    }
                    .onReceive(keyboardPublisher) { isKeyboardVisible in
                        if isKeyboardVisible {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation {
    //                                proxy.scrollTo("bottom", anchor: .bottom)
                                    proxy.scrollTo(messages.last?.id, anchor: .bottom)
                                }
                            }
                        }
                    }
                    .onTapGesture {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                    messageField(proxy: proxy)
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
        } else {
            Text("Something went wrong . . .")
        }
       
    }
    
    func sendMessage(_ proxy: ScrollViewProxy) {
        if !newMessage.isEmpty {
            withAnimation {
                navigator.selectedConversation?.messages.append(Message(id: navigator.selectedConversation?.messages.count ?? 0 + 1, body: newMessage, sender: userManager.user, senderId: userManager.user?.id ?? 0, recipients: [], createdAt: Date(), updatedAt: Date()))
                
                newMessage = ""
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    withAnimation {
                        proxy.scrollTo(navigator.selectedConversation?.messages.last?.id, anchor: .bottom)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func header() -> some View {
        let companion = navigator.selectedConversation?.participants.first!
        let url = companion?.pictures?.first ?? ""
        
        VStack {
            AsyncImage(url: URL(string: url), content: { image in
                image
                    .resizable()
                    .scaledToFill()
            }, placeholder: {ProgressView()})
            .frame(width: Size.w(64), height: Size.w(64))
            .clipShape(Circle())
            .padding(.top, Size.w(30))
            
            VStack(spacing: 10) {
                Text("강남, Channel")
                    .foregroundColor(.yellow300)
                + Text(" 에서")
                    .foregroundColor(.gray500)
                
                let diff = Date() - (navigator.selectedConversation?.createdAt ?? Date())
                let endTime: TimeInterval = 24 * 60 * 60
             
                Text(diff.toPassedTime())
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
    
    @ViewBuilder
    func messageField(proxy: ScrollViewProxy) -> some View {
        VStack {
            Divider()
            
            ZStack {
                HStack {
                    // TODO: TextEditor ?
                    TextField("메세지를 입력하세요.", text: $newMessage)
                        .onSubmit {
                            sendMessage(proxy)
                        }
                    
                    Button(action: {
                        sendMessage(proxy)
                    }) {
                        Image("send-button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: Size.w(24), height: Size.w(24))
                    }
                    .opacity(newMessage.isEmpty ? 0 : 1)
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
    ConversationView()
}
