//
//  MockDetailMovieInteractor.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import Foundation
@testable import movies_challenge

struct DetailMovieInteractorCalls {
    var didGetData: Bool = false
    var didGetError: Bool = false
}

class MockDetailMovieInteractor: DetailMovieInteractorInterface {
    lazy var calls = DetailMovieInteractorCalls()
    var detailMovie: DetailMovie?
    
    func getDetailMovie(_ idMovie: Int, completion: @escaping (Result<DetailMovie, CustomError>) -> Void) {
        if let detailMovie = detailMovie {
            calls.didGetData = true
            completion(.success(detailMovie))
        } else {
            calls.didGetError = true
            completion(.failure(.responseError))
        }
    }
    
}
