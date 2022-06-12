//
//  Endpoint.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

enum Endpoint {
    
    case popular
    case topRated
    case upcoming
    case detail(id: Int)
    
    var path: String {
        switch self {
        case .popular:
            return "movie/popular"
        case .topRated:
            return "movie/top_rated"
        case .upcoming:
            return "movie/upcoming"
        case let .detail(id):
            return "movie/\(id)"
        }
    }
}
