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

protocol HomeInteractorInterface {
    func getData(completion: @escaping (Result<[Movie], CustomError>) -> Void)
}

protocol HomeViewInterface {
    var isFiltering: Bool { get }
        
    func didGetError(_ message: String)
    func reloadData()
}

protocol HomePresenterInterface {
    var numberOfItemsInSection: Int { get }
    var searchHint: String { get }
    var title: String { get }
    
    func filterContentForSearchText(_ searchText: String)
    func getItem(at indexPath: IndexPath) -> MovieViewModel
    func getMovies()
}
