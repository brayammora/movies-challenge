//
//  HomePresenterTests.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 15/06/22.
//

import XCTest
@testable import movies_challenge

class HomePresenterTests: XCTestCase {
    
    var sut: HomePresenter?
    let interactor = MockHomeInteractor()
    let router = MockHomeRouter()
    let view = MockHomeView()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomePresenter(router: router, interactor: interactor, view: view)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_getMovies_WhenSucessResponse_ThenCheckMoviesCount() {
        // Given
        let movies = [
            Movie(id: 0, posterPath: nil, name: "The Great Movie", category: .popular)
        ]
        interactor.movies = movies
        // When
        sut?.getMovies()
        // Then
        XCTAssertTrue(interactor.calls.didGetData)
        XCTAssertEqual(sut?.numberOfItems, 1)
    }
    
    func test_getMovies_WhenFailureResponse_ThenGetError() {
        // Given
        interactor.movies = []
        // When
        sut?.getMovies()
        // Then
        XCTAssertTrue(interactor.calls.didGetError)
        XCTAssertTrue(view.calls.didGetError)
    }
    
    func test_getItem_WhenIndexPathIsValid_ThenGetModel() {
        // Given
        let movies = [
            Movie(id: 0, posterPath: nil, name: "The Great Movie", category: .popular)
        ]
        let mockIndexPath = IndexPath(row: 0, section: 0)
        interactor.movies = movies
        // When
        sut?.getMovies()
        let viewModel = sut?.getItem(at: mockIndexPath)
        // Then
        XCTAssertNotNil(viewModel)
    }
    
    func test_getItem_WhenIndexPathIsNotValid_ThenGetNothing() {
        // Given
        let movies = [
            Movie(id: 0, posterPath: nil, name: "The Great Movie", category: .popular)
        ]
        let mockIndexPath = IndexPath(row: 5, section: 0)
        interactor.movies = movies
        // When
        sut?.getMovies()
        let viewModel: MovieViewModel? = sut?.getItem(at: mockIndexPath)
        // Then
        XCTAssertNil(viewModel)
    }
    
    func test_didSelectItem_WhenIndexPathIsValid_ThenItsRoutedToNextView() {
        // Given
        let movies = [
            Movie(id: 0, posterPath: nil, name: "The Great Movie", category: .popular)
        ]
        let mockIndexPath = IndexPath(row: 0, section: 0)
        interactor.movies = movies
        // When
        sut?.getMovies()
        sut?.didSelectItem(at: mockIndexPath)
        // Then
        XCTAssertTrue(router.calls.didNavigateToDetailMovie)
    }
    
    func test_filterContentForSearchText_WhenKeywordIsFound_ThenMoviesIsFiltered() {
        // Given
        let movies = [
            Movie(id: 0, posterPath: nil, name: "The Great Movie", category: .popular),
            Movie(id: 1, posterPath: nil, name: "Fantastic Movies and Where to Find Them", category: .topRated),
            Movie(id: 2, posterPath: nil, name: "Stranger Movies", category: .upcoming)
        ]
        interactor.movies = movies
        // When
        let searchText = "great"
        let category: MovieCategory = .popular
        sut?.getMovies()
        view.isFiltering = true
        sut?.filterContentForSearchText(searchText, category)
        // Then
        XCTAssertEqual(sut?.numberOfItems, 1)
    }
    
    func test_filterContentForSearchText_WhenKeywordIsNotFound_ThenMoviesIsFiltered() {
        // Given
        let movies = [
            Movie(id: 0, posterPath: nil, name: "The Great Movie", category: .popular),
            Movie(id: 1, posterPath: nil, name: "Fantastic Movies and Where to Find Them", category: .topRated),
            Movie(id: 2, posterPath: nil, name: "Stranger Movies", category: .upcoming)
        ]
        interactor.movies = movies
        // When
        let searchText = "abcsdefasd"
        let category: MovieCategory = .popular
        sut?.getMovies()
        view.isFiltering = true
        sut?.filterContentForSearchText(searchText, category)
        // Then
        XCTAssertEqual(sut?.numberOfItems, 0)
    }
}
