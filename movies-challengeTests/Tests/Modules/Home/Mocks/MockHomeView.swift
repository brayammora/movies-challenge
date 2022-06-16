//
//  MockHomeView.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 15/06/22.
//

import Foundation
@testable import movies_challenge

struct HomeViewCalls {
    var didGetError: Bool = false
    var didHideLoader: Bool = false
    var didPresentLoader: Bool = false
    var didReloadData: Bool = false
}

class MockHomeView: HomeViewInterface {
    lazy var calls = HomeViewCalls()
    
    var isFiltering: Bool = false
    var isSearchBarEmpty: Bool = false
    func didGetError(_ message: String) {
        calls.didGetError = true
    }
    func hideLoader() {
        calls.didHideLoader = true
    }
    func presentLoader() {
        calls.didPresentLoader = true
    }
    func reloadData() {
        calls.didReloadData = true
    }
}
