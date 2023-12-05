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
    var gender: String?
    var pictures: [String]?
    var liked: [String]?
    var passed: [String]?
    var terms: Bool?
    var fakeImage: String?
    
    //TODO: fix it
    var age: Int {
        Date().years(from: birthDate ?? Date())
    }

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case birthDate
        case bio
        case gender
        case pictures
        case liked
        case passed
        case terms
        case fakeImage
    }
}
