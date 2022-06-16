//
//  HomeInteractorTests.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import XCTest
@testable import movies_challenge

class HomeInteractorTests: XCTestCase {
    
    var sut: HomeInteractor?
    let mockServiceManager = MockServiceManager()
    let mockDispatchGroup = DispatchGroup()

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeInteractor(serviceManager: mockServiceManager, homeServicesGroup: mockDispatchGroup)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func test_getData_WhenSucessResponse_ThenResultCompletionBringsData() {
        // Given
        let expectation = self.expectation(description: "Fetching all movies")
        mockServiceManager.calls.shouldRetrieveData = true
        // When
        sut?.getData { response in
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
        sut?.getData { response in
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

