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
    var avatarURL: String
    var name: String
    var location: String?
    var bio: String?
    var publicGists: Int
    var publicRepos: Int
    var following: Int
    var Followers: Int
    var createdAt: String
}
