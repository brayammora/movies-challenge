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
        let interactor = HomeInteractor()
        let presenter = HomePresenter(router: self, interactor: interactor, view: viewController)
        viewController.presenter = presenter
    }
}
