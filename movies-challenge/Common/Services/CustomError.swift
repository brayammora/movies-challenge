//
//  CustomError.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

enum CustomError: Error {
    case badUrl
    case responseError
    case unableToParse
    case noInternetConnection
}
