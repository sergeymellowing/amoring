//
//  NetworkService.swift
//  amoring
//
//  Created by 이준녕 on 12/8/23.
//

import Foundation
import Apollo

final class  NetworkService {
    static let shared = NetworkService()
    
    private(set) var apollo = ApolloClient(url: URL(string: "https://spacex-production.up.railway.app/")!)
    
    private init() { }
}
