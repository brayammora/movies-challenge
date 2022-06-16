//
//  DetailMovie.swift
//  movies-challenge
//
//  Created by Brayam Mora on 14/06/22.
//

import Foundation

struct DetailMovie: Codable {
    let title: String
    let summary: String?
    let image: String?
    let releaseDate: String
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case summary = "overview"
        case image = "backdrop_path"
        case releaseDate = "release_date"
        case status
    }
}
