//
//  MessagesView.swift
//  amoring
//
//  Created by 이준녕 on 11/20/23.
//

import SwiftUI
import NavigationStackBackport

struct MessagesView: View {
    @StateObject var navigator = NavigationsMessagesController()
    
    @State var torchIsOn = false
    @State var haveTable = false
    @State var resultString: String? = nil
    
    var body: some View {
        NavigationStackBackport.NavigationStack(path: $navigator.path) {
            VStack(alignment: .center, spacing: 0) {
                ListOfPeopleLikesLink()
                
                ListOfMessages()
            }
            .padding(.horizontal, Size.w(22))
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .background(.gray1000)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("AMORING")
                        .font(bold20Font)
                        .foregroundColor(.yellow300)
                }
            }
            .navigationBarItems(trailing:
                                    Button(action: {
                
            }) {
                Image("ic-info")
                    .resizable()
                    .scaledToFit()
                    .frame(width: Size.w(32), height: Size.w(32))
            }
            )
            .environmentObject(navigator)
            .backport.navigationDestination(for: MessagesPath.self) { screen in
                navigator.navigate(screen: screen)
            }
            
        }
    }
}


struct ListOfMessages: View {
    @State var messages: [String] = ["👋 첫인사를 보내보세요!", "저 곧 나가요 다음에 뵈요!"]
    
    /// height of bottom bar + padding
    let bottomSpacing = Size.w(75) + Size.w(16)
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("메시지")
                Text("(\(messages.count))")
            }
            .font(medium18Font)
            .foregroundColor(.yellow300)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.bottom, Size.w(20))
            
            if messages.isEmpty {
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
                List(messages, id: \.self) { message in
                    ChatRow(message: message)
                        .listRowInsets(EdgeInsets())
                        .listRowBackground(Color.clear)
                }
                .listStyle(.plain)
            }
        }
    }
}

struct ChatRow: View {
    let message: String
    
    var body: some View {
        HStack(spacing: 0) {
            Color.yellow
                .frame(width: Size.w(64), height: Size.w(64))
                .clipShape(Circle())
                .padding(.trailing, Size.w(12))
            
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    Text("하입보이요")
                        .font(medium16Font)
                        .foregroundColor(.gray300)
                    Circle().fill()
                        .foregroundColor(.green300)
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
                Text(message)
                    .font(regular14Font)
                    .foregroundColor(.yellow600)
                    .padding(.bottom, Size.w(6))
                Text("24시간 후 메시지가 사라집니다.")
                    .font(regular12Font)
                    .foregroundColor(.gray700)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
        .frame(height: Size.w(64))
        .padding(.bottom, Size.w(12))
        .padding(.top, Size.w(10))
    }
}

struct ListOfPeopleLikesLink: View {
    @EnvironmentObject var navigator: NavigationsMessagesController
    
    var body: some View {
        VStack(alignment: .leading, spacing: Size.w(14)) {
            Text("리스트")
                .font(medium18Font)
                .foregroundColor(.yellow300)
            
            HStack {
                ZStack(alignment: .topLeading) {
                    Image("person-0")
                        .resizable()
                        .blur(radius: 6)
                        .scaledToFill()
                        .frame(width: Size.w(73), height: Size.w(98))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(2)
                        .background(Color.gray1000)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .rotationEffect(.degrees(7), anchor: .bottomLeading)
                        .offset(x: Size.w(15))
                    
                    Image("person-1")
                        .resizable()
                        .blur(radius: 6)
                        .scaledToFill()
                        .frame(width: Size.w(73), height: Size.w(98))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .padding(2)
                        .background(Color.gray1000)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        
                    ZStack {
                        HStack {
                            Image(systemName: "heart.fill")
                            Text("리스트 보기")
                        }
                            .font(semiBold12Font)
                            .foregroundColor(.yellow200)
                            .padding(.horizontal, Size.w(14))
                            .padding(.vertical, Size.w(9))
                            .background(Color.gray1000)
                            .clipShape(Capsule())
                            .overlay(Capsule().stroke(Color.gray900, lineWidth: 1))
                    }
                    .frame(width: Size.w(113), height: Size.w(114), alignment: .bottomTrailing)
                }
                .frame(width: Size.w(113), height: Size.w(114), alignment: .topLeading)
                .padding(.trailing, Size.w(12))
                
                VStack(alignment: .leading) {
                    Text("리스트에는 회원님을 좋아요한\n라운지 멤버들이 모두 나타납니다.")
                        .font(light14Font)
                        .foregroundColor(.gray400)
                        .lineSpacing(6)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom, Size.w(12))
                    
                    Button(action: {
                        navigator.path.append(MessagesPath.list)
                    }) {
                        Text("리스트 확인하기 >")
                            .font(medium14Font)
                            .foregroundColor(.gray600)
                    }
                    .frame(height: Size.w(32))
                    .frame(maxWidth: .infinity, alignment: .trailing)
                }
                .frame(height: Size.w(114), alignment: .bottom)
            }
        }
        .padding(.top, Size.w(16))
        .padding(.bottom, Size.w(45))
    }
}


#Preview {
    CheckInView()
//    ChatRow()
//        .padding(.horizontal, Size.w(22))
}
