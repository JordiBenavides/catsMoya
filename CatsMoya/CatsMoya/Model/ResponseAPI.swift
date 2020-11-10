//
//  ResponseAPI.swift
//  CatsMoya
//
//  Created by Jordi Milla on 10/11/2020.
//  Copyright © 2020 Jordi Milla Catalan. All rights reserved.
//

import Foundation

struct Response: Codable {
    let all:[Cats]
}

struct Cats: Codable {
    let _id: String
    let text: String
    let user: User
    let upvotes: Int
}

struct User: Codable {
    let _id:String
    let name: Name
}
struct Name: Codable {
    let first: String
    let last: String
}

