//
//  Interest.swift
//  amoring
//
//  Created by 이준녕 on 12/15/23.
//

import Foundation

struct Interest: Codable {
    enum InterestCategory: Codable {
        case interest, music, food, travel, movie, sport
    }
    
    let id: Int
    let title: String
    let category: InterestCategory
}
