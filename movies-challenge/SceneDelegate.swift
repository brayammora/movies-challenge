//
//  SceneDelegate.swift
//  movies-challenge
//
//  Created by Brayam Mora on 10/06/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        let homeRouter = HomeRouter()
        navigationController.pushViewController(homeRouter.viewController, animated: false)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}
