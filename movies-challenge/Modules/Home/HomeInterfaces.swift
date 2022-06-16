//
//  HomeInterfaces.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import Foundation

enum HomeStrings {
    static let title = "Movies"
    static let searchHint = "Tap to find"
}

enum HomeNavigationOption {
    case detailMovie(id: Int)
}

protocol HomeRouterInterface {
    func navigate(to option: HomeNavigationOption)
}

protocol HomeInteractorInterface {
    func getData(completion: @escaping (Result<[Movie], CustomError>) -> Void)
}

protocol HomeViewInterface {
    var isFiltering: Bool { get }
    var isSearchBarEmpty: Bool { get }
        
    func didGetError(_ message: String)
    func hideLoader()
    func presentLoader()
    func reloadData()
}

protocol HomePresenterInterface {
    var numberOfItems: Int { get }
    var searchHint: String { get }
    var title: String { get }
    
    func didSelectItem(at indexPath: IndexPath)
    func filterContentForSearchText(_ searchText: String, _ category: MovieCategory)
    func getItem(at indexPath: IndexPath) -> MovieViewModel?
    func getMovies()
}
