//
//  GFError.swift
//  GHFollowers
//
//  Created by Kamil Wrobel on 3/1/20.
//  Copyright © 2020 Kamil Wrobel. All rights reserved.
//

import Foundation


enum GFError: String, Error {
    case invalidUserName = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the serwer. Please try again."
    case invalidData = "The data recived from the serwer was invalid. Please try again."
    case unableToFavorite = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "You already favorited this user."
}
