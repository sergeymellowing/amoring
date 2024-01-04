//
//  Interest.swift
//  amoring
//
//  Created by 이준녕 on 12/15/23.
//

import Foundation

enum InterestCategory: Codable, CaseIterable {
    case interest, music, food, travel, movie, sport
    
    func title() -> String {
        switch self {
        case .interest:
            return "관심사"
        case .music:
            return "음악"
        case .food:
            return "푸드&음료"
        case .travel:
            return "여행"
        case .movie:
            return "영화&소설"
        case .sport:
            return "스포츠"
        }
    }
}

struct Interest: Codable, Hashable {
    let id: Int
    let title: String
    let category: InterestCategory
}
