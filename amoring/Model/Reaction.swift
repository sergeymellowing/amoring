//
//  Reaction.swift
//  amoring
//
//  Created by 이준녕 on 12/19/23.
//

import Foundation

struct Reaction: Hashable {
    let byUserId: Int
    let toUserId: Int
    var createdAt: Date?
    var updatedAt: Date?
    var like: Bool
}
