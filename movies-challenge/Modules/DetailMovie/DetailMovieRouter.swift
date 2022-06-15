//
//  DetailMovieRouter.swift
//  movies-challenge
//
//  Created by Brayam Mora on 12/06/22.
//

import UIKit

class DetailMovieRouter: BaseRouter {
    
    init(_ idMovie: Int) {
        let viewController = DetailMovieViewController()
        super.init(viewController: viewController)
        let interactor = DetailMovieInteractor()
        let presenter = DetailMoviePresenter(router: self, interactor: interactor, view: viewController, idMovie: idMovie)
        viewController.presenter = presenter
    }
}

// MARK: - DetailMovieRouterInterface -
extension DetailMovieRouter: DetailMovieRouterInterface { }
