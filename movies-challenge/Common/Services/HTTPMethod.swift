//
//  HTTPMethod.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    
    var name: String {
        return rawValue
    }
}
