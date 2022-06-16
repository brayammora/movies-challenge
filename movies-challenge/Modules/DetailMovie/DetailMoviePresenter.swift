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
    private var sections: [DetailMovieTableViewSections] = []
    private var detailMovie: DetailMovie?
    
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
    
    private func getSections() {
        sections.append(.image)
        
        if let summary = detailMovie?.summary,
           !summary.isEmpty {
            sections.append(.summary)
        }
        if let releaseDate = detailMovie?.releaseDate,
           !releaseDate.isEmpty {
            sections.append(.releaseDate)
        }
        if let status = detailMovie?.status,
           !status.isEmpty {
            sections.append(.status)
        }
    }
}

// MARK: - DetailMoviePresenterInterface -
extension DetailMoviePresenter: DetailMoviePresenterInterface {
    
    var numberOfItemsInSection: Int { detailMovie != nil ? 1 : 0 }
    var numberOfSections: Int { detailMovie != nil ? sections.count : 0 }
    
    func getDetailMovie() {
        view.presentLoader()
        interactor.getDetailMovie(idMovie) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case .success(let detailMovie):
                self.detailMovie = detailMovie
                self.getSections()
                self.view.reloadData()
            case .failure(let error):
                let message: String = error == .noInternetConnection ? ErrorStrings.noInternetMessage : ErrorStrings.defaultMessage
                self.view.didGetError(message)
            }
            self.view.hideLoader()
            
        }
    }
    
    func getItem(at indexPath: IndexPath) -> DetailMovieTableSection? {
        guard let detailMovie = detailMovie,
              indexPath.section < sections.count
        else { return nil }
        
        let section = sections[indexPath.section]
        
        switch section {
        case .image:
            let completePath = "\(NetworkConstants.baseImageUrl)\(detailMovie.image ?? "")"
            return .image(DetailImageViewModel(posterPath: completePath))
        case .summary:
            return .info(DetailInfoViewModel(title: section.titleHeader, information: detailMovie.summary ?? ""))
        case .releaseDate:
            return .info(DetailInfoViewModel(title: section.titleHeader, information: detailMovie.releaseDate))
        case .status:
            return .info(DetailInfoViewModel(title: section.titleHeader, information: detailMovie.status))
        }
    }
}
