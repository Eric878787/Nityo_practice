//
//  DataModel.swift
//  Nityo_practice
//
//  Created by Eric chung on 2022/7/5.
//

import Foundation

struct UserInfo: Codable {
    var response: [User]
}

struct User: Codable {
    var name: String
    var kokoid: String
}

struct FriendList: Codable {
    var response: [Friend]
}

struct Friend: Codable, Equatable, Hashable {
    var name: String
    var status: Int
    var isTop: String
    var fid: String
    var updateDate: String
    var hashValue: Int { get { return name.hashValue } }
    static func ==(left:Friend, right:Friend) -> Bool {
        return left.name == right.name
        
    }
}
