//
//  YoutubeSearchResponse.swift
//  Netflix_Clone
//
//  Created by Kalybay Zhalgasbay on 21.04.2022.
//

import Foundation

struct YoutubeSearchResponse: Codable {
    let items: [VideoElement]
}

struct VideoElement: Codable {
    let id: IdVideoElement
}

struct IdVideoElement: Codable {
    let kind: String
    let videoId: String
}
