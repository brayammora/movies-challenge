//
//  Movie.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

enum MovieCategory: Int, Codable, CaseIterable {
    case all
    case popular
    case topRated
    case upcoming
    
    var name: String {
        switch self {
        case .all: return "All"
        case .popular: return "Popular"
        case .topRated: return "Top rated"
        case .upcoming: return "Upcoming"
        }
    }
}

struct Movie: Codable {
    let id: Int
    let posterPath: String?
    let name: String
    let category: MovieCategory?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
        case name = "original_title"
        case category
    }
}
