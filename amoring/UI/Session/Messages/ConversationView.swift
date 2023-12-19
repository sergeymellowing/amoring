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
    
    var conversation: Conversation = Dummy.conversations.first!
    
    @State var newMessage = ""
    
    var body: some View {
        let companion = conversation.participants.first!
        let url = companion.pictures?.first ?? ""
        
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack {
                        ForEach(conversation.messages, id: \.self) { message in
                            Text(message.body)
                                .padding()
                                .id(message.id)
                        }
                    }
                    .onReceive(Just(conversation.messages)) { _ in
                        withAnimation {
                            proxy.scrollTo(conversation.messages.last, anchor: .bottom)
                        }
                        
                    }.onAppear {
                        withAnimation {
                            proxy.scrollTo(conversation.messages.last, anchor: .bottom)
                        }
                    }
                }
                
                HStack {
                    TextField("Send a message", text: $newMessage)
                        .textFieldStyle(.roundedBorder)
                    Button(action: sendMessage)   {
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
                    .frame(width: Size.w(32), height: Size.w(32))
                    .clipShape(Circle())
                        
                    Text(companion.name ?? "")
                        .font(medium20Font)
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
    
    func sendMessage() {
        if !newMessage.isEmpty{
            //                messages.append(Message(content: newMessage, isCurrentUser: true))
            //                messages.append(Message(content: "Reply of " + newMessage , isCurrentUser: false))
            newMessage = ""
        }
    }
}


#Preview {
    ConversationView(conversation: Dummy.conversations.first!)
}
