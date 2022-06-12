//
//  HomeInteractor.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

class HomeInteractor: BaseService {
    
    private func getPopularMovies() { }
}

// MARK: - HomeInteractorInterface -
extension HomeInteractor: HomeInteractorInterface {
    
    func getData(completion: @escaping (Result<PopularMovies, CustomError>) -> Void) {
        let params = [
            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey),
            URLQueryItem(name: "language", value: "en"),
            URLQueryItem(name: "page", value: "1")
        ]
        sendRequest(endpoint: .popular, queryParams: params, of: PopularMovies.self, method: .get, completion: completion)
    }
}
