//
//  DetailMovieInterfaces.swift
//  movies-challenge
//
//  Created by Brayam Mora on 12/06/22.
//

import Foundation

protocol DetailMovieRouterInterface { }

protocol DetailMovieInteractorInterface { }

protocol DetailMovieViewInterface {
    func hideLoader()
    func presentLoader()
}

protocol DetailMoviePresenterInterface {
    var numberOfItemsInSection: Int { get }
    
    func getItem(at indexPath: IndexPath) -> DetailMovieTableSection?
}

enum DetailMovieTableSection {
    case image(detailImageViewModel: DetailImageViewModel)
    case info(infoViewModel: DetailInfoViewModel)
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
