//
//  MockHomeInteractor.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 15/06/22.
//

import Foundation
@testable import movies_challenge

struct HomeInteractorCalls {
    var didGetData: Bool = false
    var didGetError: Bool = false
}

class MockHomeInteractor: HomeInteractorInterface {
    lazy var calls = HomeInteractorCalls()
    lazy var movies: [Movie] = []
    
    func getData(completion: @escaping (Result<[Movie], CustomError>) -> Void) {
        if !movies.isEmpty {
            calls.didGetData = true
            completion(.success(movies))
        } else {
            calls.didGetError = true
            completion(.failure(.responseError))
        }
    }
}
