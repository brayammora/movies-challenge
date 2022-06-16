//
//  BaseService.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

protocol BaseService {
    func sendRequest<T: Codable>(endpoint: Endpoint, queryParams: [URLQueryItem]?, of: T.Type, method: HTTPMethod, completion: @escaping (Result<T, CustomError>) -> Void)
}
