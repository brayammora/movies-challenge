//
//  DetailMovieInteractor.swift
//  movies-challenge
//
//  Created by Brayam Mora on 12/06/22.
//

import Foundation

class DetailMovieInteractor {
    
    private let serviceManager: BaseService
    
    init(serviceManager: BaseService) {
        self.serviceManager = serviceManager
    }
}

// MARK: - DetailMovieInteractorInterface -
extension DetailMovieInteractor: DetailMovieInteractorInterface {
    
    func getDetailMovie(_ idMovie: Int, completion: @escaping (Result<DetailMovie, CustomError>) -> Void) {
        let params = [
            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey),
            URLQueryItem(name: "language", value: "en"),
            URLQueryItem(name: "page", value: "1")
        ]
        serviceManager.sendRequest(
            endpoint: .detail(id: idMovie),
            queryParams: params,
            of: DetailMovie.self,
            method: .get,
            completion: completion
        )
    }
}
