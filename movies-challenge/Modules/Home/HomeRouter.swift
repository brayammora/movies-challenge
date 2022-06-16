//
//  HomeCoordinator.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import UIKit

class HomeRouter: BaseRouter {
    
    init() {
        let viewController = HomeViewController()
        super.init(viewController: viewController)
        let dispatchGroup = DispatchGroup()
        let serviceManager = ServiceManager()
        let interactor = HomeInteractor(serviceManager: serviceManager, homeServicesGroup: dispatchGroup)
        let presenter = HomePresenter(router: self, interactor: interactor, view: viewController)
        viewController.presenter = presenter
    }
}

extension HomeRouter: HomeRouterInterface {
    
    func navigate(to option: HomeNavigationOption) {
        switch option {
        case .detailMovie(let id):
            let detailMovieRouter = DetailMovieRouter(id)
            navigationController?.pushViewController(detailMovieRouter.viewController, animated: true)
        }
    }
}
