//
//  DetailMovieInteractorTests.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import XCTest
@testable import movies_challenge

class DetailMovieInteractorTests: XCTestCase {
    
    var sut: DetailMovieInteractor?
    let mockServiceManager = MockServiceManager()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DetailMovieInteractor(serviceManager: mockServiceManager)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_getData_WhenSucessResponse_ThenResultCompletionBringsData() {
        // Given
        let expectation = self.expectation(description: "Fetching detail movie")
        mockServiceManager.calls.shouldRetrieveData = true
        // When
        sut?.getDetailMovie(0) { response in
            switch response {
            case .success:
                expectation.fulfill()
            case .failure:
                XCTFail("Must bring data")
            }
        }
        // Then
        wait(for: [expectation], timeout: 1)
    }
    
    func test_getData_WhenFailureResponse_ThenResultCompletionBringsError() {
        // Given
        let expectation = self.expectation(description: "Fetching error")
        mockServiceManager.calls.shouldRetrieveData = false
        // When
        sut?.getDetailMovie(0) { response in
            switch response {
            case .success:
                XCTFail("Must bring error")
            case .failure:
                expectation.fulfill()
            }
        }
        // Then
        wait(for: [expectation], timeout: 1)
    }
}

