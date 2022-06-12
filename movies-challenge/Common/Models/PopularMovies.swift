//
//  PopularMovies.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

struct PopularMovies: Codable {
    let page: Int
    let movies: [Movie]
    let totalResults: Int
    let totalPages: Int
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case movies = "results"
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }
}
