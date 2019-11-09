//
//  Article.swift
//  NewYork Time Demo
//
//  Created by RAKESH BISWAL on 09/11/19.
//  Copyright © 2019 RAKESH BISWAL. All rights reserved.
//


struct Articles: Decodable {
    var results: [Article]
}

struct Article: Decodable {
    var title: String
    var byline: String
    var abstract: String
    var publishedDate: String
    var media: [ArticleMedia]
}
struct ArticleMedia: Decodable {
    var mediaMetadata: [ArticleMediaMetaData]

    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
    
    init(mediaMetaData: [ArticleMediaMetaData]) {
        self.mediaMetadata = mediaMetaData
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        mediaMetadata = try container.decode([ArticleMediaMetaData].self, forKey: .mediaMetadata)
    }
    
    
}

struct ArticleMediaMetaData: Decodable {
    var url: String
    var format: String
}
