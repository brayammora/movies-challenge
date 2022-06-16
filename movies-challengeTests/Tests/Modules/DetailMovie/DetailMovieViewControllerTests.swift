//
//  DetailMovieViewControllerTests.swift
//  movies-challengeTests
//
//  Created by Brayam Mora on 16/06/22.
//

import XCTest
@testable import movies_challenge

class DetailMovieViewControllerTests: XCTestCase {
    
    var sut: DetailMovieViewController?
    let presenter = MockDetailMoviePresenter()
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = DetailMovieViewController()
        sut?.presenter = presenter
        triggerViewControllerLifeCycle(for: sut)
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        sut = nil
    }
    
    func testRegisteredCells() {
        let tableView = sut?.getTableView()
        var cellList: [UITableViewCell?] = []
        cellList.append(tableView?.dequeueReusableCell(withIdentifier: DetailImageViewCell.name))
        cellList.append(tableView?.dequeueReusableCell(withIdentifier: DetailInfoViewCell.name))
        
        cellList.forEach { cell in
            XCTAssertNotNil(cell)
        }
    }
}
