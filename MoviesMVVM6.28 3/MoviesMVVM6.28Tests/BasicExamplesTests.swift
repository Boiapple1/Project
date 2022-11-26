//
//  BasicExamplesTests.swift
//  MoviesMVVM6.28Tests
//
//  Created by iAskedYou2nd on 7/28/22.
//

import XCTest
@testable import MoviesMVVM6_28

class BasicExamplesTests: XCTestCase {
    
    var basic: BasicExamples?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.basic = BasicExamples()
    }

    override func tearDownWithError() throws {
        self.basic = nil
        try super.tearDownWithError()
    }
    
    func testAddInts() {
        // Arrange
        let first = 5
        let second = 23
        
        // Act
        let sum = self.basic?.add(lhs: first, rhs: second)
        
        // Assert
        XCTAssertEqual(sum, 28)
    }
    
    func testAddDouble() {
        // Arrange
        let first = 5.5
        let second = 23.3
        
        // Act
        let sum = self.basic?.add(lhs: first, rhs: second)
        
        // Assert
        XCTAssertEqual(sum, 28.8)
    }

    func testMulitplyInt() {
        // Arrange
        let first = 2
        let second = 5
        
        // Act
        let sum = self.basic?.multiply(lhs: first, rhs: second)
        
        // Assert
        XCTAssertEqual(sum, 10)
    }
    
    func testMulitplyDouble() {
        // Arrange
        let first = 2.5
        let second = 5.5
        
        // Act
        let sum = self.basic?.multiply(lhs: first, rhs: second)
        
        // Assert
        XCTAssertEqual(sum, 13.75)
    }
    
    
    func testDelayedAdd() {
        // Arrange
        let first = 2
        let second = 5
        var sum: Int?
        let expectation = XCTestExpectation(description: "Delayed Sum")
        
        // Act
        self.basic?.delayedAdd(lhs: first, rhs: second, completion: { val in
            sum = val
            expectation.fulfill()
        })
        wait(for: [expectation], timeout: 4)
        
        // Assert
        XCTAssertEqual(sum, 7)
    }
    

}
