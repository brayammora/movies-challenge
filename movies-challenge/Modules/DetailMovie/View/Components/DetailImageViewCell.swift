//
//  DetailImageViewCell.swift
//  movies-challenge
//
//  Created by Brayam Mora on 12/06/22.
//

import UIKit

struct DetailImageViewModel {
    let posterPath: String
}

final class DetailImageViewCell: UITableViewCell {
    
    private lazy var posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()

    func configure(viewModel: DetailImageViewModel) {
        posterImageView.downloadImage(from: viewModel.posterPath)
        posterImageViewConstraints()
    }
    
    private func posterImageViewConstraints() {
        contentView.addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            posterImageView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
}
