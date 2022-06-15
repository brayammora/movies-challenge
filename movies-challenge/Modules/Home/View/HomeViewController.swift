//
//  HomeViewController.swift
//  movies-challenge
//
//  Created by Brayam Mora on 11/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Private properties -
    private lazy var collectionView: UICollectionView = {
        let layout = CollectionViewHorizontalCustom()
        layout.height = 150
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MovieViewCell.self, forCellWithReuseIdentifier: MovieViewCell.name)
        collectionView.backgroundColor = .black
        collectionView.addSubview(refreshControl)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private lazy var refreshControl: UIRefreshControl = {
       let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(onRefresh), for: .valueChanged)
        refreshControl.tintColor = .red
        return refreshControl
    }()
    
    private lazy var searchController: UISearchController = {
        let searchBarContoller = UISearchController(searchResultsController: nil)
        searchBarContoller.searchResultsUpdater = self
        searchBarContoller.obscuresBackgroundDuringPresentation = false
        searchBarContoller.searchBar.placeholder = presenter.searchHint
        searchBarContoller.searchBar.barStyle = .black
        return searchBarContoller
    }()
    
    // MARK: - Public properties -
    var presenter: HomePresenterInterface!
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarColor()
        configureSearchBar()
        configureView()
        title = presenter.title
        presenter.getMovies()
    }

    // MARK: - Private methods -
    private func configureView() {
        view.addSubview(collectionView)
        let constraints = [
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 4),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 4),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -4),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -4)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureSearchBar() {
        navigationItem.searchController = searchController
        definesPresentationContext = true
        searchController.searchBar.scopeButtonTitles = MovieCategory.allCases.map { $0.name }
        searchController.searchBar.delegate = self

    }
    
    // MARK: - Actions -
    @objc private func onRefresh() {
        presenter.getMovies()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }
}

// MARK: - HomeViewInterface -
extension HomeViewController: HomeViewInterface {
    
    var isFiltering: Bool {
      let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
      return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }
    
    var isSearchBarEmpty: Bool { searchController.searchBar.text?.isEmpty ?? true }
    
    func didGetError(_ message: String) {
        collectionView.setEmptyMessage(message)
    }
    
    func hideLoader() {
        hideLoading()
    }
    
    func presentLoader() {
        showLoading()
    }
    
    func reloadData() {
        collectionView.reloadData()
        collectionView.setContentOffset(.zero, animated: false)
    }
}

// MARK: - UISearchBarDelegate -
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if let searchText = searchController.searchBar.text {
            let category = MovieCategory(rawValue: selectedScope) ?? .all
            presenter.filterContentForSearchText(searchText, category)
        }
    }
}

// MARK: - UISearchResultsUpdating -
extension HomeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        if let searchText = searchBar.text {
            let category = MovieCategory(rawValue: searchBar.selectedScopeButtonIndex) ?? .all
            presenter.filterContentForSearchText(searchText, category)
        }
    }
}

// MARK: - UICollectionViewDataSource -
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfItemsInSection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieViewCell.name, for: indexPath) as? MovieViewCell
        else {
            return UICollectionViewCell()
        }
        let viewModel = presenter.getItem(at: indexPath)
        cell.configure(with: viewModel)
        return cell
    }
}

// MARK: - UICollectionViewDelegate -
extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectItem(at: indexPath)
    }
}
