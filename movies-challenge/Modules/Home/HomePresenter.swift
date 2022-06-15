//
//  HomePresenter.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

class HomePresenter {
    
    // MARK: - Private properties -
    private let router: HomeRouterInterface
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
    init(router: HomeRouterInterface, interactor: HomeInteractorInterface, view: HomeViewInterface) {
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
    
    func didSelectItem(at indexPath: IndexPath) {
        let moviesTarget = isFiltering ? moviesFiltered : movies
        let movie = moviesTarget[indexPath.row]
        router.navigate(to: .detailMovie(id: movie.id))
    }
    
    func filterContentForSearchText(_ searchText: String, _ category: MovieCategory) {
        moviesFiltered = []
        moviesFiltered = movies.filter { (movie: Movie) -> Bool in
            let doesCategoryMatch = category == .all || movie.category == category
            if view.isSearchBarEmpty {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && movie.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func getItem(at indexPath: IndexPath) -> MovieViewModel {
        let moviesTarget = isFiltering ? moviesFiltered : movies
        let movie = moviesTarget[indexPath.row]
        let completePath = "\(NetworkConstants.baseImageUrl)\(movie.posterPath ?? "")"
        return MovieViewModel(posterUrl: completePath)
    }
    
    func getMovies() {
        view.presentLoader()
        interactor.getData { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let movies):
                self.movies = movies
            case .failure(let error):
                let message: String = error == .noInternetConnection ? ErrorStrings.noInternetMessage : ErrorStrings.defaultMessage
                self.view.didGetError(message)
            }
            self.view.hideLoader()
        }
    }
}
