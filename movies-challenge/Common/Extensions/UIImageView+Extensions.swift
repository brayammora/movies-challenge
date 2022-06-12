//
//  UIImageView+Extensions.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import UIKit

extension UIImageView {
    
    func downloadImage(from path: String) {
        guard let url = URL(string: path) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.name
        
        let task = URLSession.shared.dataTask(with: request) { (data, _, _) in
            guard let data = data,
                  let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async {
                self.image = image
            }
        }
        task.resume()
    }
}
