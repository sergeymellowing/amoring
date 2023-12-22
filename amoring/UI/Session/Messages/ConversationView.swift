//
//  ConversationView.swift
//  amoring
//
//  Created by 이준녕 on 12/19/23.
//

import SwiftUI
import Combine

struct ConversationView: View {
    @EnvironmentObject var navigator: NavigationsMessagesController
    @EnvironmentObject var sessionController: SessionController
    @EnvironmentObject var userManager: UserManager
    
    @State var conversation: Conversation = Dummy.conversations.first!
    
    @State var newMessage = ""
    
    var body: some View {
        let companion = conversation.participants.first!
        let url = companion.pictures?.first ?? ""
        
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack {
                        ForEach(conversation.messages, id: \.self) { message in
                            MessageView(message: message)
                                .id(message.id)
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
                
                HStack {
                    TextField("Send a message", text: $newMessage)
                        .textFieldStyle(.roundedBorder)
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
                        Image(systemName: "paperplane")
                    }
                }
                .padding()
                .padding(.bottom, 100)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.gray1000)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    AsyncImage(url: URL(string: url), content: { image in
                        image
                            .resizable()
                            .scaledToFill()
                    }, placeholder: {ProgressView()})
                    .frame(width: Size.w(20), height: Size.w(20))
                    .clipShape(Circle())
                        
                    Text(companion.name ?? "")
                        .font(medium16Font)
                        .foregroundColor(.yellow300)
                }
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
}

struct MessageView: View {
    @EnvironmentObject var userManager: UserManager
    let message: Message
    
    var body: some View {
        let isOwner = message.senderId == userManager.user?.id
        
        Text(message.body)
            .padding()
            .background(isOwner ? Color.yellow350 : Color.gray800)
            .cornerRadius(15, corners: isOwner ? [.bottomLeft, .topLeft, .topRight] : [.bottomRight, .topLeft, .topRight])
            .padding(.horizontal)
            .padding(isOwner ? .leading : .trailing, Size.w(20))
            .frame(maxWidth: .infinity, alignment: !isOwner ? .leading : .trailing)
    }
}


#Preview {
    ConversationView(conversation: Dummy.conversations.first!)
}
