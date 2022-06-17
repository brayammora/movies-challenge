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
    
    private var filteredMovies: [Movie] = [] {
        didSet {
            view.reloadData()
        }
    }
    
    private var isFiltering: Bool { view.isFiltering }
    private var moviesTarget: [Movie] { isFiltering ? filteredMovies : movies }

    
    // MARK: - Lifecycle -
    init(router: HomeRouterInterface, interactor: HomeInteractorInterface, view: HomeViewInterface) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
}

// MARK: - HomePresenterInterface -
extension HomePresenter: HomePresenterInterface {
    
    var numberOfItems: Int { isFiltering ? filteredMovies.count : movies.count }
    var searchBarTitles: [String] { MovieCategory.allCases.map { $0.name } }
    var searchHint: String { HomeStrings.searchHint }
    var title: String { HomeStrings.title }
    
    func didSelectItem(at indexPath: IndexPath) {
        guard indexPath.row < moviesTarget.count else { return }
        let movie = moviesTarget[indexPath.row]
        router.navigate(to: .detailMovie(id: movie.id))
    }
    
    func filterContentForSearchText(_ searchText: String, _ category: MovieCategory) {
        filteredMovies = []
        filteredMovies = movies.filter {
            let doesCategoryMatch = category == .all || $0.category == category
            if view.isSearchBarEmpty {
                return doesCategoryMatch
            } else {
                return doesCategoryMatch && $0.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func getItem(at indexPath: IndexPath) -> MovieViewModel? {
        guard indexPath.row < moviesTarget.count else { return nil }
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
                let message = error == .noInternetConnection ? ErrorStrings.noInternetMessage : ErrorStrings.defaultMessage
                self.view.didGetError(message)
            }
            self.view.hideLoader()
        }
    }
}
