//
//  TopRatedMovies.swift
//  movies-challenge
//
//  Created by Brayam Mora on 12/06/22.
//

import Foundation

struct TopRatedMovies: Codable {
    let page: Int
    let movies: [Movie]
    let totalResults: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page
        case movies = "results"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
