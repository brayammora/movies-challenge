//
//  MockDetailMovieRouter.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import Foundation
@testable import movies_challenge

struct DetailMovieRouterCalls { }

class MockDetailMovieRouter: DetailMovieRouterInterface {
    lazy var calls = DetailMovieRouterCalls()
}
