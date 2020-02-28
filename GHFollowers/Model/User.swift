//
//  User.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 2/25/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import Foundation


struct User: Codable{
    var login: String
    var avatarUrl: String
    var name: String
    var location: String?
    var bio: String?
    var publicGists: Int
    var publicRepos: Int
    var following: Int
    var followers: Int
    var createdAt: String
}
