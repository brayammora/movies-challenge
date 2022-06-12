//
//  UpcomingMovies.swift
//  movies-challenge
//
//  Created by Brayam Mora on 12/06/22.
//

import Foundation

struct UpcomingMovies: Codable {
    let page: Int
    let movies: [Movie]
    let dates: RatedDate
    let totalResults: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case dates
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}

struct RatedDate: Codable {
    let maximum: String
    let minimum: String
}
