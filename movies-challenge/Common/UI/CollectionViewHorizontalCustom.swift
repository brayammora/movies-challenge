//
//  CollectionViewHorizontalCustom.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import UIKit

class CollectionViewHorizontalCustom: UICollectionViewFlowLayout {
    
    private enum Constants {
        static let minimumLineSpacing: CGFloat = 4
        static let minimumInteritemSpacing: CGFloat = 4
    }
    
    var height: CGFloat = 0.0 {
        didSet {
            configLayout()
        }
    }

    var cellInRow: CGFloat = 3
    var rows: CGFloat = 4

    override func invalidateLayout() {
        super.invalidateLayout()
        configLayout()
    }
    
    func configLayout() {
        minimumLineSpacing = Constants.minimumLineSpacing
        minimumInteritemSpacing = Constants.minimumInteritemSpacing
        scrollDirection = .vertical
        if let collectionView = collectionView {
            let optimisedWidth = (collectionView.frame.width - minimumInteritemSpacing) / cellInRow - rows
            itemSize = CGSize(width: optimisedWidth, height: height)
        }
    }
}

