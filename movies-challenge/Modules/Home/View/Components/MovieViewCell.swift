//
//  MoviesViewCell.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import UIKit

struct MovieViewModel {
    let posterUrl: String?
}

final class MovieViewCell: UICollectionViewCell {
    
    // MARK: - Private properties -
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    // MARK: - Lifecycle -
    override init(frame: CGRect) {
        super.init(frame: frame)
        posterImageViewConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods -
    private func posterImageViewConstraints() {
        contentView.addSubview(posterImageView)
        NSLayoutConstraint.activate([
            posterImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setDefaultPoster() {
        
    }
    
    // MARK: - Public methods -
    func configure(with viewModel: MovieViewModel) {
        guard let posterUrl = viewModel.posterUrl else {
            setDefaultPoster()
            return
        }
        posterImageView.downloadImage(from: posterUrl)
    }
}
