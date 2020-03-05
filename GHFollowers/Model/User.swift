//
//  User.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 2/25/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import Foundation


struct User: Codable{
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicGists: Int
    let publicRepos: Int
    let following: Int
    let followers: Int
    let createdAt: String
    let htmlUrl: String
}
