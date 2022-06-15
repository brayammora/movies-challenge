//
//  DetailInfoViewCell.swift
//  movies-challenge
//
//  Created by Brayam Mora on 12/06/22.
//

import UIKit

struct DetailInfoViewModel {
    let title: String
    let information: String
}

final class DetailInfoViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .red
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private lazy var informationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.numberOfLines = 0
        return label
    }()

    func configure(viewModel: DetailInfoViewModel) {
        titleLabel.text = viewModel.title
        informationLabel.text = viewModel.information
        backgroundColor = .black
        titleLabelConstraints()
        informationLabelConstraints()
    }
    
    private func titleLabelConstraints() {
        contentView.addSubview(titleLabel)
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func informationLabelConstraints() {
        contentView.addSubview(informationLabel)
        let constraints = [
            informationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            informationLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            informationLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            informationLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
