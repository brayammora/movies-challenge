//
//  MockHomeRouter.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 15/06/22.
//

import Foundation
@testable import movies_challenge

struct HomeRouterCalls {
    var didNavigateToDetailMovie: Bool = false
}

class MockHomeRouter: HomeRouterInterface {
    lazy var calls = HomeRouterCalls()
    
    func navigate(to option: HomeNavigationOption) {
        switch option {
        case .detailMovie:
            calls.didNavigateToDetailMovie = true
        }
    }
}
