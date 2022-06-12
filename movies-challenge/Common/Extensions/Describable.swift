//
//  Describable.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import UIKit

protocol Describable {
    static var name: String { get }
}

extension Describable {
    static var name: String {
        return String(describing: self)
    }
}

extension UICollectionViewCell: Describable { }

extension UITableViewCell: Describable { }
