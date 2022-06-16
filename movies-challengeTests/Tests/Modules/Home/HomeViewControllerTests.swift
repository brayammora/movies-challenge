//
//  HomeViewControllerTests.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import XCTest
@testable import movies_challenge

class HomeViewControllerTests: XCTestCase {
    
    var sut: HomeViewController?
    let presenter = MockHomePresenter()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = HomeViewController()
        sut?.presenter = presenter
        triggerViewControllerLifeCycle(for: sut)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testRegisteredCells() {
        let collectionView = sut?.getCollectionView()
        let cell = collectionView?.dequeueReusableCell(
            withReuseIdentifier: MovieViewCell.name,
            for: IndexPath(index: 0)
        )
        XCTAssertNotNil(cell)
    }
}
