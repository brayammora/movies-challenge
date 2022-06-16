//
//  MockServiceManager.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import Foundation
@testable import movies_challenge

struct ServiceManagerCalls {
    var shouldRetrieveData: Bool = false
}

class MockServiceManager: BaseService {
    
    lazy var calls = ServiceManagerCalls()
    
    func sendRequest<T>(
        endpoint: Endpoint,
        queryParams: [URLQueryItem]?,
        of type: T.Type,
        method: HTTPMethod,
        completion: @escaping (Result<T, CustomError>) -> Void
    ) where T : Decodable, T : Encodable {
        if calls.shouldRetrieveData {
            switch type {
            case is PopularMovies.Type:
                let response = generatePopularMoviesResponse()
                completion(.success(response as! T))
            case is TopRatedMovies.Type:
                let response = generateTopRatedMoviesResponse()
                completion(.success(response as! T))
            case is UpcomingMovies.Type:
                let response = generateUpcomingMoviesResponse()
                completion(.success(response as! T))
            case is DetailMovie.Type:
                let response = generateDetailMovieResponse()
                completion(.success(response as! T))
            default:
                completion(.failure(.unableToParse))
            }
        } else {
            completion(.failure(.responseError))
        }
        
    }
    
    private func generatePopularMoviesResponse() -> PopularMovies? {
        let bundle = Bundle(for: MockServiceManager.self)
        guard let model: PopularMovies = FileManager.getJSONObject(from: "PopularMovies", bundle: bundle) else { return nil }
        return model
    }
    
    private func generateTopRatedMoviesResponse() -> TopRatedMovies? {
        let bundle = Bundle(for: MockServiceManager.self)
        guard let model: TopRatedMovies = FileManager.getJSONObject(from: "TopRatedMovies", bundle: bundle) else { return nil }
        return model
    }
    
    private func generateUpcomingMoviesResponse() -> UpcomingMovies? {
        let bundle = Bundle(for: MockServiceManager.self)
        guard let model: UpcomingMovies = FileManager.getJSONObject(from: "UpcomingMovies", bundle: bundle) else { return nil }
        return model
    }
    
    private func generateDetailMovieResponse() -> DetailMovie? {
        let bundle = Bundle(for: MockServiceManager.self)
        guard let model: DetailMovie = FileManager.getJSONObject(from: "DetailMovie", bundle: bundle) else { return nil }
        return model
    }
}
