//
//  BaseRouter.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import UIKit

class BaseRouter {

    var viewController: UIViewController
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}
