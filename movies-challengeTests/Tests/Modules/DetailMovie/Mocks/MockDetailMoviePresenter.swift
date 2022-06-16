//
//  MockDetailMoviePresenter.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import Foundation
@testable import movies_challenge

struct DetailMoviePresenterCalls {
    var didGetDetailMovie: Bool = false
    var didGetItem: Bool = false
}

class MockDetailMoviePresenter: DetailMoviePresenterInterface {
    lazy var calls = DetailMoviePresenterCalls()
    
    var numberOfItemsInSection: Int = 0
    var numberOfSections: Int = 0
    
    func getDetailMovie() {
        calls.didGetDetailMovie = true
    }
    func getItem(at indexPath: IndexPath) -> DetailMovieTableSection? {
        calls.didGetItem = true
        return nil
    }
    
}
