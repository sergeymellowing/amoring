//
//  User.swift
//  amoring
//
//  Created by 이준녕 on 11/22/23.
//

import Foundation

public struct User: Codable, Equatable {
    var id: String?
    var name: String?
    var birthDate: Date?
    var bio: String?
    var isMale: Bool?
    var pictures: [String]?
    var liked: [String]?
    var passed: [String]?
    
    //TODO: fix it
    var age: Int {
        Date().years(from: birthDate ?? Date())
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case birthDate
        case bio
        case isMale = "male"
        case pictures
        case liked
        case passed
    }
}
