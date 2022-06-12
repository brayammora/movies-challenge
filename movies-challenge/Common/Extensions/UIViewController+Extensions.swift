//
//  UIViewController+Extensions.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarColor() {
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.tintColor = .red
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
    }
}
