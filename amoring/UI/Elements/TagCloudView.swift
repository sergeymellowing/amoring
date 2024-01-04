//
//  TagCloudView.swift
//  amoring
//
//  Created by 이준녕 on 12/14/23.
//

import SwiftUI

struct TagCloudView: View {
    var tags: [String?]
    @State var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStacktotalHeight: CGFloat.infinity, 
    var isDark: Bool = false
    
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        let filteredTags = self.tags.filter({ $0 != nil })
        
        return ZStack(alignment: .topLeading) {
            ForEach(filteredTags, id: \.self) { tag in
                self.item(for: tag)
                    .padding(.trailing, 8)
                    .padding(.vertical, 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if tag == filteredTags.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if tag == filteredTags.last! {
                            height = 0 // last item
                        }
                        return result
                    })
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String?) -> some View {
        text == nil ? nil : Chip(text: text ?? "", isDark: isDark)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct Chip: View {
    let text: String
    var isDark: Bool = false
    
    var body: some View {
        Text(text)
            .font(medium16Font)
            .foregroundColor(isDark ? .gray150 : .black)
            .lineLimit(1)
            .padding(.horizontal, Size.w(18))
            .padding(.vertical, Size.w(8))
            .background(isDark ? Color.gray1000 : Color.yellow300)
            .clipShape(Capsule())
    }
}


struct TagCloudViewSelectable: View {
    let cat: InterestCategory
    @Binding var selectedInterests: [String]
    @State var totalHeight
          = CGFloat.zero       // << variant for ScrollView/List
    //    = CGFloat.infinity   // << variant for VStacktotalHeight: CGFloat.infinity,

    var body: some View {
        VStack(alignment: .leading) {
            Text(cat.title())
                .font(regular16Font)
                .foregroundColor(.black)
                .padding(.leading, Size.w(14))
            GeometryReader { geometry in
                self.generateContent(in: geometry)
            }
        }
        .frame(height: totalHeight)// << variant for ScrollView/List
        //.frame(maxHeight: totalHeight) // << variant for VStack
        
        .padding(.bottom, Size.w(30))
    }

    private func generateContent(in g: GeometryProxy) -> some View {
        var width = CGFloat.zero
        var height = CGFloat.zero
        
        let interests = {
            switch cat {
            case .interest:
                Constants.interests
            case .music:
                Constants.music
            case .food:
                Constants.food_drink
            case .travel:
                Constants.travel
            case .movie:
                Constants.movies_novels
            case .sport:
                Constants.sport
            }
        }()
        
        return ZStack(alignment: .topLeading) {
            ForEach(interests, id: \.self) { interest in
                self.item(for: interest.title)
                    .padding(.trailing, 8)
                    .padding(.vertical, 4)
                    .alignmentGuide(.leading, computeValue: { d in
                        if (abs(width - d.width) > g.size.width)
                        {
                            width = 0
                            height -= d.height
                        }
                        let result = width
                        if interest == interests.last! {
                            width = 0 //last item
                        } else {
                            width -= d.width
                        }
                        return result
                    })
                    .alignmentGuide(.top, computeValue: {d in
                        let result = height
                        if interest == interests.last! {
                            height = 0 // last item
                        }
                        return result
                    })
                    .onTapGesture {
                        if !self.selectedInterests.contains(interest.title) {
                            if selectedInterests.count < 7 {
                                withAnimation(.smooth) {
                                    self.selectedInterests.append(interest.title)
                                }
                            }
                        } else {
                            withAnimation(.smooth) {
                                self.selectedInterests.removeAll(where: { $0 == interest.title })
                            }
                        }
                    }
            }
        }.background(viewHeightReader($totalHeight))
    }

    private func item(for text: String) -> some View {
        InterestChip(selectedInterests: $selectedInterests, text: text)
    }

    private func viewHeightReader(_ binding: Binding<CGFloat>) -> some View {
        return GeometryReader { geometry -> Color in
            let rect = geometry.frame(in: .local)
            DispatchQueue.main.async {
                binding.wrappedValue = rect.size.height
            }
            return .clear
        }
    }
}

struct InterestChip: View {
    @Binding var selectedInterests: [String]
    let text: String
    
    var body: some View {
        let selected = selectedInterests.contains(text)
        Text(text)
            .font(medium16Font)
            .foregroundColor(selected ? .gray150 : .black)
            .lineLimit(1)
            .padding(.horizontal, Size.w(18))
            .padding(.vertical, Size.w(8))
            .background(selected ? Color.gray1000 : Color.white)
            .clipShape(Capsule())
    }
}

#Preview {
//    TagCloudView(tags: [])
    TagCloudViewSelectable(cat: .interest, selectedInterests: .constant([]))
}
