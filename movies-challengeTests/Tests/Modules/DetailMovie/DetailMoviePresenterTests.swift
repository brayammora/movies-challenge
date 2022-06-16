//
//  DetailMoviePresenterTests.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import XCTest
@testable import movies_challenge

class DetailMoviePresenterTests: XCTestCase {
    
    var sut: DetailMoviePresenter?
    let interactor = MockDetailMovieInteractor()
    let router = MockDetailMovieRouter()
    let view = MockDetailMovieView()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DetailMoviePresenter(router: router, interactor: interactor, view: view, idMovie: 0)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_getDetailMovie_WhenSucessResponse_ThenCheckCount() {
        // Given
        let detailMovie = DetailMovie(
            title: "Stranger Movies",
            summary: "Good soundtrack",
            image: nil,
            releaseDate: "2021-07-01",
            status: "Upcoming"
        )
        interactor.detailMovie = detailMovie
        // When
        sut?.getDetailMovie()
        // Then
        XCTAssertTrue(interactor.calls.didGetData)
        XCTAssertEqual(sut?.numberOfItemsInSection, 1)
    }
    
    func test_getDetailMovie_WhenFailureResponse_ThenGetError() {
        // Given
        interactor.detailMovie = nil
        // When
        sut?.getDetailMovie()
        // Then
        XCTAssertTrue(interactor.calls.didGetError)
        XCTAssertEqual(sut?.numberOfItemsInSection, 0)
    }
    
    func test_getItem_WhenIndexPathIsValid_ThenGetModel() {
        // Given
        let detailMovie = DetailMovie(
            title: "Stranger Movies",
            summary: "Good soundtrack",
            image: nil,
            releaseDate: "2021-07-01",
            status: "Upcoming"
        )
        let mockIndexPath = IndexPath(row: 0, section: 0)
        interactor.detailMovie = detailMovie
        // When
        sut?.getDetailMovie()
        let viewModel = sut?.getItem(at: mockIndexPath)
        // Then
        XCTAssertNotNil(viewModel)
    }
    
    func test_getItem_WhenIndexPathIsNotValid_ThenGetNothing() {
        // Given
        let detailMovie = DetailMovie(
            title: "Stranger Movies",
            summary: "Good soundtrack",
            image: nil,
            releaseDate: "2021-07-01",
            status: "Upcoming"
        )
        let mockIndexPath = IndexPath(row: 0, section: 5)
        interactor.detailMovie = detailMovie
        // When
        sut?.getDetailMovie()
        let viewModel = sut?.getItem(at: mockIndexPath)
        // Then
        XCTAssertNil(viewModel)
    }
}
