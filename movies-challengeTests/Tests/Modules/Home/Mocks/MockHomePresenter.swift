//
//  MockHomePresenter.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import Foundation
@testable import movies_challenge

struct HomePresenterCalls {
    var didSelectItem: Bool = false
    var didFilterContentForSearchText: Bool = false
    var didGetItem: Bool = false
    var didGetMovies: Bool = false
}

class MockHomePresenter: HomePresenterInterface {
    lazy var calls = HomePresenterCalls()
    
    var numberOfItems: Int = 0
    var searchHint: String = ""
    var title: String = ""
    
    func didSelectItem(at indexPath: IndexPath) {
        calls.didSelectItem = true
    }
    
    func filterContentForSearchText(_ searchText: String, _ category: MovieCategory) {
        calls.didFilterContentForSearchText = true
    }
    
    func getItem(at indexPath: IndexPath) -> MovieViewModel? {
        calls.didGetItem = true
        return nil
    }
    
    func getMovies() {
        calls.didGetMovies = true
    }
}
