//
//  ResultModel.swift
//  DubbzilTask_WaleedMahmoud
//
//  Created by Waleed on 11/19/20.
//  Copyright © 2020 Waleed. All rights reserved.
//

import Foundation

struct ListingResponse: Codable {
    var results: [Result]?
}

struct Result: Codable, Equatable {
    var createdAt: String?
    var price: String?
    var name: String?
    var uid: String?
    var imageIds: [String]?
    var imageUrls: [String]?
    var imageThumbnails: [String]?
    
    enum CodingKeys: String, CodingKey, Equatable {
        case createdAt = "created_at"
        case price ,name , uid
        case imageIds = "image_ids"
        case imageUrls = "image_urls"
        case imageThumbnails = "image_urls_thumbnails"
        
    }
    
    public static func ==(lhs: Result, rhs: Result) -> Bool{
        return
            lhs.createdAt == rhs.createdAt &&
            lhs.price == rhs.price &&
            lhs.name == rhs.name &&
            lhs.uid == rhs.uid &&
            lhs.imageIds == rhs.imageIds &&
            lhs.imageUrls == rhs.imageUrls
    }

}
