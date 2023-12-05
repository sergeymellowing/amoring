//
//  SwipibleProfileVIew.swift
//  amoring
//
//  Created by 이준녕 on 12/5/23.
//

import SwiftUI

struct SwipibleProfileVIew: View {
    
    private let nope = "NOPE"
    private let like = "LIKE"
    private let screenWidthLimit = UIScreen.main.bounds.width * 0.5
    
    let user: User
    @State private var dragOffset = CGSize.zero
    @Binding var swipeAction: SwipeAction
    
    var onSwiped: (User, Bool) -> ()
    
    var body: some View {
        ProfileCardView(user: user)
            .overlay(
                HStack{
                    Text(like).font(.largeTitle).bold().foregroundGradient(colors: [Color.green200]).padding().overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(LinearGradient(gradient: .init(colors: [Color.green200]),
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing), lineWidth: 4)
                    ).rotationEffect(.degrees(-30)).opacity(getLikeOpacity())
                    Spacer()
                    Text(nope).font(.largeTitle).bold().foregroundGradient(colors: [Color.red200]).padding().overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(LinearGradient(gradient: .init(colors: [Color.red200]),
                                                   startPoint: .topLeading,
                                                   endPoint: .bottomTrailing), lineWidth: 4)
                    ).rotationEffect(.degrees(30)).opacity(getDislikeOpacity())

                }.padding(.top, 45).padding(.leading, 20).padding(.trailing, 20)
                ,alignment: .top)
            .offset(x: self.dragOffset.width,y: self.dragOffset.height)
            .rotationEffect(.degrees(self.dragOffset.width * 0.06), anchor: .center)
            .simultaneousGesture(DragGesture(minimumDistance: 0.0).onChanged{ value in
                self.dragOffset = value.translation
            }.onEnded{ value in
                performDragEnd(value.translation)
                print("onEnd: \(value.location)")
            }).onChange(of: swipeAction, perform: { newValue in
                if newValue != .doNothing {
                    performSwipe(newValue)
                }
            })
    }
    
    private func performSwipe(_ swipeAction: SwipeAction){
        withAnimation(.linear(duration: 0.3)){
            if(swipeAction == .swipeRight){
                self.dragOffset.width += screenWidthLimit * 2
            } else if(swipeAction == .swipeLeft){
                self.dragOffset.width -= screenWidthLimit * 2
            }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            onSwiped(user, swipeAction == .swipeRight)
        }
        self.swipeAction = .doNothing
    }
    
    private func performDragEnd(_ translation: CGSize){
        let translationX = translation.width
        if(hasLiked(translationX)){
            withAnimation(.linear(duration: 0.3)){
                self.dragOffset = translation
                self.dragOffset.width += screenWidthLimit
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                onSwiped(user, true)
            }
        } else if(hasDisliked(translationX)){
            withAnimation(.linear(duration: 0.3)){
                self.dragOffset = translation
                self.dragOffset.width -= screenWidthLimit
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                onSwiped(user, false)
            }
        } else{
            withAnimation(.default){
                self.dragOffset = .zero
            }
        }
    }
    
    private func hasLiked(_ value: Double) -> Bool{
        let ratio: Double = dragOffset.width / screenWidthLimit
        return ratio >= 1
    }
    
    private func hasDisliked(_ value: Double) -> Bool{
        let ratio: Double = -dragOffset.width / screenWidthLimit
        return ratio >= 1
    }
    
    private func getLikeOpacity() -> Double{
        let ratio: Double = dragOffset.width / screenWidthLimit;
        if(ratio >= 1){
            return 1.0
        } else if(ratio <= 0){
            return 0.0
        } else {
            return ratio
        }
    }
    
    private func getDislikeOpacity() -> Double{
        let ratio: Double = -dragOffset.width / screenWidthLimit;
        if(ratio >= 1){
            return 1.0
        } else if(ratio <= 0){
            return 0.0
        } else {
            return ratio
        }
    }
}
//
//#Preview {
//    SwipibleProfileVIew()
//}
