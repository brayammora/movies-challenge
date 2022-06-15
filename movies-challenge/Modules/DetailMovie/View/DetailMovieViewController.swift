//
//  DetailMovieViewController.swift
//  movies-challenge
//
//  Created by Brayam Mora on 12/06/22.
//

import UIKit

class DetailMovieViewController: UIViewController {

    // MARK: - IBOutlets -
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Public properties -
    var presenter: DetailMoviePresenterInterface!
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Private methods -
    private func configureTableView() {
        tableView.register(DetailImageViewCell.self, forCellReuseIdentifier: DetailImageViewCell.name)
        tableView.register(DetailInfoViewCell.self, forCellReuseIdentifier: DetailInfoViewCell.name)
        tableView.dataSource = self
    }
}

// MARK: - DetailMovieViewInterface -
extension DetailMovieViewController: DetailMovieViewInterface {
    
    func hideLoader() {
        hideLoading()
    }
    
    func presentLoader() {
        showLoading()
    }
}

// MARK: - UITableViewDataSource -
extension DetailMovieViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = presenter.getItem(at: indexPath) else { return UITableViewCell() }
    
        switch section {
        case .image(let detailImageViewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailImageViewCell.name, for: indexPath) as? DetailImageViewCell
            else {
                return UITableViewCell()
            }
            cell.configure(viewModel: detailImageViewModel)
            return cell
        case .info(let infoViewModel):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailInfoViewCell.name, for: indexPath) as? DetailInfoViewCell
            else {
                return UITableViewCell()
            }
            cell.configure(viewModel: infoViewModel)
            return cell
        }
    }
}
