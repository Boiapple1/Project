//
//  MovieViewModelTests.swift
//  MoviesMVVM6.28Tests
//
//  Created by iAskedYou2nd on 7/29/22.
//

import XCTest
@testable import MoviesMVVM6_28

class MovieViewModelTests: XCTestCase {

    var viewModel: MovieViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.viewModel = MovieViewModel(networkManager: MockService())
    }

    override func tearDownWithError() throws {
        self.viewModel = nil
        try super.tearDownWithError()
    }
    
    func testRequestModelDataSuccess() {
        // Arrange
        let expectation = XCTestExpectation(description: "Successfully retrieving Models")
        
        // Act
        self.viewModel?.bind {
            expectation.fulfill()
        }
        self.viewModel?.getMovies()
        wait(for: [expectation], timeout: 3)
        
        // Assert
        XCTAssertEqual(self.viewModel?.count, 20)
        XCTAssertEqual(self.viewModel?.movieTitle(for: 0), "Thor: Love and Thunder")
    }

    
    // TODO: Write test cases for image functionality and flows
    

}
