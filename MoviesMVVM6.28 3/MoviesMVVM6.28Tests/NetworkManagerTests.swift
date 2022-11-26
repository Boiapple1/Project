//
//  NetworkManagerTests.swift
//  MoviesMVVM6.28Tests
//
//  Created by iAskedYou2nd on 7/28/22.
//

import XCTest
@testable import MoviesMVVM6_28

class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkManager?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.networkManager = NetworkManager(session: MockSession())
    }

    override func tearDownWithError() throws {
        self.networkManager = nil
        try super.tearDownWithError()
    }

    func testGetModelDataSuccess() {
        // Arrange
        var models: [Movie] = []
        let expectation = XCTestExpectation(description: "Successfully Fetched Movies")
        
        // Act
        self.networkManager?.getModel(url: NetworkParams.popularMovies(1).url) { (result: Result<MoviePage, NetworkError>) in
            switch result {
            case .success(let page):
                models = page.results
                expectation.fulfill()
            case .failure:
                XCTFail()
            }
        }
        wait(for: [expectation], timeout: 3)
        
        // Assert
        XCTAssertEqual(models.count, 20)
        XCTAssertEqual(models.first?.title, "Thor: Love and Thunder")
        XCTAssertEqual(models.first?.id, 616037)
    }
    
    func testGetModelDataURLFailure() {
        // Arrange
        var error: NetworkError?
        let expectation = XCTestExpectation(description: "URL Failure")
        
        // Act
        self.networkManager?.getModel(url: nil, completion: { (result: Result<MoviePage, NetworkError>) in
            switch result {
            case .success:
                XCTFail()
            case .failure(let err):
                error = err
                expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 3)
        
        // Assert
        XCTAssertEqual(error, NetworkError.urlFailure)
    }
    
    func testGetModelDataFailure() {
        // Arrange
        var error: NetworkError?
        let expectation = XCTestExpectation(description: "Data Failure")
        
        // Act
        self.networkManager?.getModel(url: URL(string: "https://DataFailure"), completion: { (result: Result<MoviePage, NetworkError>) in
            switch result {
            case .success:
                XCTFail()
            case .failure(let err):
                error = err
                expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 3)
        
        // Assert
        XCTAssertEqual(error, NetworkError.dataFailure)
    }
    
    func testGetModelGenericFailure() {
        // Arrange
        var error: NetworkError?
        let expectation = XCTestExpectation(description: "Generic Failure")
        
        // Act
        self.networkManager?.getModel(url: URL(string: "https://GenericFailure"), completion: { (result: Result<MoviePage, NetworkError>) in
            switch result {
            case .success:
                XCTFail()
            case .failure(let err):
                error = err
                expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 3)
        
        // Assert
        XCTAssertEqual(error, NetworkError.other(NSError(domain: "Test", code: 0, userInfo: nil)))
    }
    
    func testGetModelResponseFailure() {
        // Arrange
        var error: NetworkError?
        let expectation = XCTestExpectation(description: "Status Code Failure")
        
        // Act
        self.networkManager?.getModel(url: URL(string: "https://StatusCodeFailure"), completion: { (result: Result<MoviePage, NetworkError>) in
            switch result {
            case .success:
                XCTFail()
            case .failure(let err):
                error = err
                expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 3)
        
        // Assert
        XCTAssertEqual(error, NetworkError.serverResponse(404))
    }
    
    func testGetModeDecodeFailure() {
        // Arrange
        var error: NetworkError?
        let expectation = XCTestExpectation(description: "Decode Failure")
        
        // Act
        self.networkManager?.getModel(url: URL(string: "https://DecodeFailure"), completion: { (result: Result<Movie, NetworkError>) in
            switch result {
            case .success:
                XCTFail()
            case .failure(let err):
                error = err
                expectation.fulfill()
            }
        })
        wait(for: [expectation], timeout: 3)
        
        // Assert
        XCTAssertEqual(error, NetworkError.decodeError(NSError(domain: "Test", code: 0, userInfo: nil)))
        
    }
    

}
