//
//  ExpandedView.swift
//  amoring
//
//  Created by 이준녕 on 12/14/23.
//

import SwiftUI
import CachedAsyncImage

struct ExpandedView: View {
    let user: User
    
    private func pictures() -> [String] {
        var temp: [String] = []
        if let pics = user.pictures, pics.count > 2 {
            temp = pics
            temp.removeFirst()
        }
        return temp
    }
    
    var body: some View {
        VStack(spacing: 0) {
            if user.height != nil || user.weight != nil || user.job != nil || user.education != nil || user.mbti != nil {
                VStack(alignment: .leading) {
                    Text("기본정보")
                        .font(bold26Font)
                        .foregroundColor(.black)
                    
                    TagCloudView(tags: [
                        user.height.toHeight(),
                        user.weight.toWeight(),
                        user.job?.description,
                        user.education?.description,
                        user.mbti?.rawValue,
                    ])
                }
                .padding(Size.w(22))
                .background(Color.yellow350)
            }
            if !user.interests.isEmpty {
                VStack(alignment: .leading) {
                    Text("관심사")
                        .font(bold26Font)
                        .foregroundColor(.black)
                    let tags: [String] = user.interests.map { $0.title }
                    TagCloudView(tags: tags)
                }
                .padding(Size.w(22))
                .background(Color.yellow350)
            }
            
            VStack(spacing: 0) {
                ForEach(pictures(), id: \.self) { url in
                    VStack(spacing: 0) {
                        Color.gray1000.frame(height: 2)
                        //                        Color.red.frame(height: 300)
                        CachedAsyncImage(url: URL(string: url))
                    }
                }
            }
            .padding(.top, Size.w(28))
        }
        .background(Color.yellow350)
    }
    
    @ViewBuilder
    private func BasicInfo() -> some View {
        if user.height != nil || user.weight != nil || user.job != nil || user.education != nil || user.mbti != nil {
            VStack(alignment: .leading) {
                Text("기본정보")
                    .font(bold26Font)
                    .foregroundColor(.black)
                
                TagCloudView(tags: [
                    user.height.toHeight(),
                    user.weight.toWeight(),
                    user.job?.description,
                    user.education?.description,
                    user.mbti?.rawValue,
                ])
            }
            .padding(Size.w(22))
            .background(Color.yellow350)
        }
    }
    
    @ViewBuilder
    private func InterestsView() -> some View {
        if !user.interests.isEmpty {
            VStack(alignment: .leading) {
                Text("관심사")
                    .font(bold26Font)
                    .foregroundColor(.black)
                let tags: [String] = user.interests.map { $0.title }
                TagCloudView(tags: tags)
            }
            .padding(Size.w(22))
            .background(Color.yellow350)
        }
    }
}

#Preview {
    ExpandedView(user: Dummy.users.first!)
}
