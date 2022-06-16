//
//  HomeInteractor.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

class HomeInteractor {
    
    private let homeServicesGroup = DispatchGroup()
    private let serviceManager: BaseService
    private var allMovies: [Movie] = []
    private var errorData: CustomError?
    
    init(serviceManager: BaseService) {
        self.serviceManager = serviceManager
    }
    
    private func getPopularMovies() {
        homeServicesGroup.enter()
        let params = [
            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey),
            URLQueryItem(name: "language", value: "en"),
            URLQueryItem(name: "page", value: "1")
        ]
        serviceManager.sendRequest(endpoint: .popular, queryParams: params, of: PopularMovies.self, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let popularMovies):
                self.getMovies(from: popularMovies.movies, category: .popular)
            case .failure(let error):
                self.errorData = error
            }
            self.homeServicesGroup.leave()
        }
    }
    
    private func getTopRatedMovies() {
        homeServicesGroup.enter()
        let params = [
            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey),
            URLQueryItem(name: "language", value: "en"),
            URLQueryItem(name: "page", value: "1")
        ]
        serviceManager.sendRequest(endpoint: .topRated, queryParams: params, of: TopRatedMovies.self, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let topRatedMovies):
                self.getMovies(from: topRatedMovies.movies, category: .topRated)
            case .failure(let error):
                self.errorData = error
            }
            self.homeServicesGroup.leave()
        }
    }
    
    private func getUpcomingMovies() {
        homeServicesGroup.enter()
        let params = [
            URLQueryItem(name: "api_key", value: NetworkConstants.apiKey),
            URLQueryItem(name: "language", value: "en"),
            URLQueryItem(name: "page", value: "1")
        ]
        serviceManager.sendRequest(endpoint: .upcoming, queryParams: params, of: UpcomingMovies.self, method: .get) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let upcomingMovies):
                self.getMovies(from: upcomingMovies.movies, category: .upcoming)
            case .failure(let error):
                self.errorData = error
            }
            self.homeServicesGroup.leave()
        }
    }
    
    private func getMovies(from movies: [Movie], category: MovieCategory) {
        movies.forEach {
            allMovies.append(Movie(id: $0.id, posterPath: $0.posterPath, name: $0.name, category: category))
        }
    }
}

// MARK: - HomeInteractorInterface -
extension HomeInteractor: HomeInteractorInterface {
    
    func getData(completion: @escaping (Result<[Movie], CustomError>) -> Void) {
        getPopularMovies()
        getTopRatedMovies()
        getUpcomingMovies()
        
        homeServicesGroup.notify(queue: DispatchQueue.main) { [weak self] in
            guard let self = self else { return }
            guard self.errorData == nil else {
                completion(.failure(self.errorData ?? .responseError))
                return
            }
            completion(.success(self.allMovies))
        }
    }
}
