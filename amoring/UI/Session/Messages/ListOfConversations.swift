//
//  ListOfConversations.swift
//  amoring
//
//  Created by 이준녕 on 12/19/23.
//

import SwiftUI

struct ListOfConversations: View {
    @EnvironmentObject var navigator: NavigationsMessagesController
    
    @State var conversations: [Conversation] = Dummy.conversations
    
    /// height of bottom bar + padding
    let bottomSpacing = Size.w(75) + Size.w(16)
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("메시지")
                Text("(\(conversations.count))")
            }
            .font(medium18Font)
            .foregroundColor(.yellow300)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, Size.w(22))
            .padding(.bottom, Size.w(20))
            
            if conversations.isEmpty {
                VStack {
                    Text("연결된 인연이\n이곳에 나타납니다")
                        .font(bold26Font)
                        .foregroundColor(.gray800)
                        .lineSpacing(7)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, Size.w(16))
                    Text("라운지에서 마음에 드는 상대를 찾아보세요.\n회원님과 상대방이 서로 좋아요하면,\n이제부터 여기서 메시지를 보낼 수 있어요!")
                        .font(medium16Font)
                        .foregroundColor(.gray800)
                        .lineSpacing(6)
                        .multilineTextAlignment(.center)
                }
                .frame(maxHeight: .infinity, alignment: .center)
                .padding(.bottom, bottomSpacing)
            } else {
                List {
                    ForEach(conversations, id: \.self.id) { conversation in
                        ChatRow(conversation: conversation)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .onTapGesture {
                                navigator.path.append(MessagesPath.conversation)
                            }
                    }
                    .onDelete(perform: delete)
                }
                .listStyle(.plain)
            }
        }
    }
    
    func delete(at offsets: IndexSet) {
        conversations.remove(atOffsets: offsets)
    }
}

struct ChatRow: View {
    let conversation: Conversation
    
    var body: some View {
        HStack(spacing: 0) {
            let user = conversation.participants.last
            let url = user?.pictures?.first ?? ""
            AsyncImage(url: URL(string: url), content: { image in
                image
                    .resizable()
                    .scaledToFill()
            }, placeholder: {ProgressView()})
            .frame(width: Size.w(64), height: Size.w(64))
            .clipShape(Circle())
            .padding(.trailing, Size.w(12))
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text(user?.name ?? "")
                        .font(medium16Font)
                        .foregroundColor(.gray300)
                    Circle().fill()
                        .foregroundColor(user?.isOnline ?? false ? .green300 : .red400)
                        .frame(width: Size.w(6), height: Size.w(6))
                    
                    Spacer()
                    Text("New")
                        .font(semiBold12Font)
                        .foregroundColor(.black)
                        .padding(.vertical, Size.w(8))
                        .padding(.horizontal, Size.w(10))
                        .background(Color.yellow300)
                        .clipShape(Capsule())
                }
                Text(conversation.messages.last?.body ?? "")
                    .font(regular14Font)
                    .foregroundColor(.yellow600)
                    .padding(.bottom, Size.w(6))
                // TODO: implement real destroy time
                let destroyTime = 24
                Text("\(destroyTime)시간 후 메시지가 사라집니다.")
                    .font(regular12Font)
                    .foregroundColor(.gray700)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
        .frame(height: Size.w(64))
        .padding(.horizontal, Size.w(22))
        .padding(.bottom, Size.w(12))
        .padding(.top, Size.w(10))
    }
}

#Preview {
    ListOfConversations()
}
