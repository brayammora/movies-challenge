//
//  XCTestCase+Extensions.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import XCTest

extension XCTestCase {
    
    func createViewControllerFromStoryBoard<T: UIViewController>(nameStoryboard: String) -> T? {
        let storyboard = UIStoryboard(name: nameStoryboard, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "\(T.self)") as? T
    }
    
    func triggerViewControllerLifeCycle(for viewController: UIViewController?) {
        guard let viewController = viewController else { return }

        _ = viewController.view
        viewController.beginAppearanceTransition(true, animated: true)
        viewController.endAppearanceTransition()
    }
}
