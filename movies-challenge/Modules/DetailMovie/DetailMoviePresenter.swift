//
//  DetailMoviePresenter.swift
//  movies-challenge
//
//  Created by Brayam Mora on 12/06/22.
//

import Foundation

class DetailMoviePresenter {
    
    // MARK: - Private properties -
    private let router: DetailMovieRouterInterface
    private let interactor: DetailMovieInteractorInterface
    private let view: DetailMovieViewInterface
    private let idMovie: Int
    
    // MARK: - Lifecycle -
    init(
        router: DetailMovieRouterInterface,
        interactor: DetailMovieInteractorInterface,
        view: DetailMovieViewInterface,
        idMovie: Int
    ) {
        self.router = router
        self.interactor = interactor
        self.view = view
        self.idMovie = idMovie
    }
}

// MARK: - DetailMoviePresenterInterface -
extension DetailMoviePresenter: DetailMoviePresenterInterface {
    
    var numberOfItemsInSection: Int { 1 }
    
    func getItem(at indexPath: IndexPath) -> DetailMovieTableSection? {
        return nil
    }
}
