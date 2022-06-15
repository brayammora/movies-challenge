//
//  LoadingScreen.swift
//  movies-challenge
//
//  Created by Brayam Mora on 13/06/22.
//

import UIKit

fileprivate var containerLoading: UIView?

extension UIViewController {
    func showLoading () {
        containerLoading = UIView(frame: view.bounds)
        guard let containerLoading = containerLoading else {
            return
        }
        
        containerLoading.backgroundColor = .lightGray
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.center = containerLoading.center
        activityIndicator.startAnimating()
        containerLoading.addSubview(activityIndicator)
        view.addSubview(containerLoading)
    }
    
    func hideLoading () {
        containerLoading?.removeFromSuperview()
        containerLoading = nil
    }
}
