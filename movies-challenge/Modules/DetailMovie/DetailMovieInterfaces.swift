//
//  DetailMovieInterfaces.swift
//  movies-challenge
//
//  Created by Brayam Mora on 12/06/22.
//

import Foundation

protocol DetailMovieRouterInterface { }

protocol DetailMovieInteractorInterface {
    func getDetailMovie(_ idMovie: Int, completion: @escaping (Result<DetailMovie, CustomError>) -> Void)
}

protocol DetailMovieViewInterface {
    func didGetError(_ message: String)
    func hideLoader()
    func presentLoader()
    func reloadData()
}

protocol DetailMoviePresenterInterface {
    var numberOfItemsInSection: Int { get }
    var numberOfSections: Int { get }
    
    func getItem(at indexPath: IndexPath) -> DetailMovieTableSection?
    func viewDidLoad()
}

enum DetailMovieTableSection {
    case image(_ detailImageViewModel: DetailImageViewModel)
    case info(_ infoViewModel: DetailInfoViewModel)
}

enum DetailMovieTableViewSections: CaseIterable {
    case summary
    case image
    case releaseDate
    case status
    
    var titleHeader: String {
        switch self {
        case .summary:
            return "Summary:"
        case .releaseDate:
            return "Release date"
        case .status:
            return "Status"
        default:
            return ""
        }
    }
}
