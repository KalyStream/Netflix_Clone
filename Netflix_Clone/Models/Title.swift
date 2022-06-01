//
//  Movie.swift
//  Netflix_Clone
//
//  Created by Kalybay Zhalgasbay on 20.04.2022.
//

import Foundation

struct TrendingTitleResponse: Codable {
    let results: [Title]
}

struct Title: Codable {
    
    let id: Int
    let mediaType: String?
    let originalName: String?
    let originalTitle: String?
    let posterPath: String?
    let overview: String?
    let voteCount: Int
    let releaseData: String?
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case mediaType = "media_type"
        case originalName = "original_name"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case overview
        case voteCount = "vote_count"
        case releaseData = "release_date"
        case voteAverage = "vote_average"
    }
}

