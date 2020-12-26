//
//  Image.swift
//  designpatterns
//
//  Created by Azam Mukhtar on 09/12/20.
//

import Foundation



struct MemesModel: Codable {
    let count: Int
    let memes: [Meme]
}

// MARK: - Meme
struct Meme: Codable, Equatable {
    let postLink: String
    let subreddit: Subreddit
    let title: String
    let url: String
    let nsfw, spoiler: Bool
    var author: String
    let ups: Int
    let preview: [String]
    
    
//    static func (lhs: LandingItem, rhs: LandingItem) -> Bool {
//        return lhs.ups == rhs.ups
//    }
}

enum Subreddit: String, Codable {
    case dankmemes = "dankmemes"
}
