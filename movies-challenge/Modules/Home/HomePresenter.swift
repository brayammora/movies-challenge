//
//  HomePresenter.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

class HomePresenter {
    
    // MARK: - Private properties -
    private let router: HomeRouter
    private let interactor: HomeInteractorInterface
    private let view: HomeViewInterface
    
    private var movies: [Movie] = [] {
        didSet {
            view.reloadData()
        }
    }
    
    private var moviesFiltered: [Movie] = [] {
        didSet {
            view.reloadData()
        }
    }
    
    private var isFiltering: Bool {
        return view.isFiltering
    }
    
    // MARK: - Lifecycle -
    init(router: HomeRouter, interactor: HomeInteractorInterface, view: HomeViewInterface) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
}

// MARK: - HomePresenterInterface -
extension HomePresenter: HomePresenterInterface {
    
    var numberOfItemsInSection: Int { isFiltering ? moviesFiltered.count : movies.count }
    var searchHint: String { HomeStrings.searchHint }
    var title: String { HomeStrings.title }
    
    func filterContentForSearchText(_ searchText: String) {
        moviesFiltered = movies.filter { (movie: Movie) -> Bool in
            return movie.name.lowercased().contains(searchText.lowercased())
        }
    }
    
    func getItem(at indexPath: IndexPath) -> MovieViewModel {
        let moviesTarget = isFiltering ? moviesFiltered : movies
        let movie = moviesTarget[indexPath.row]
        let completePath = "\(NetworkConstants.baseImageUrl)\(movie.posterPath ?? "")"
        return MovieViewModel(posterUrl: completePath)
    }
    
    func getMovies() {
        interactor.getData { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let popularMovies):
                self.movies = popularMovies.movies
            case .failure(let error):
                let message: String = error == .noInternetConnection ? ErrorStrings.noInternetMessage : ErrorStrings.defaultMessage
                self.view.didGetError(message)
            }
        }
    }
}
