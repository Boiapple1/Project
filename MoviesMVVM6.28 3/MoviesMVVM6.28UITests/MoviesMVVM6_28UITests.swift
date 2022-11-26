//
//  MoviesMVVM6_28UITests.swift
//  MoviesMVVM6.28UITests
//
//  Created by iAskedYou2nd on 8/1/22.
//

import XCTest
@testable import MoviesMVVM6_28

class MoviesMVVM6_28UITests: XCTestCase {

    var app: XCUIApplication?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        try super.setUpWithError()
        self.app = XCUIApplication()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        self.app = nil
        try super.tearDownWithError()
    }
    
    func testMainScreenAppears() {
        // Arrange
        self.app?.launch()
        
        // Act
        let titleElement = self.app?.staticTexts["Movies"]
        let buttonElement = self.app?.buttons["Button That Navigates to the Detail Screen"]
        
        // Assert
        XCTAssertEqual(titleElement?.exists, true)
        XCTAssertEqual(buttonElement?.exists, true)
    }
    
    func testNavigatesToDetailScreenAndBackToMainScreen() {
        // Arrange
        self.app?.launch()
        
        // Act
        let detailButton = self.app?.buttons["Button That Navigates to the Detail Screen"]
        detailButton?.tap()
        
        let detailLabel = self.app?.staticTexts["SampleDetailScreen"]
        
        // Assert
        XCTAssertEqual(detailLabel?.exists, true)
        
        // Act
        self.app?.navigationBars["Movies"].buttons["Movies"].tap()
        let titleElement = self.app?.staticTexts["Movies"]
        
        // Assert
        XCTAssertEqual(titleElement?.exists, true)
    }
    
    // MARK: Does not actually test anything, just showcases the screen recording button
    func testNavigationWithScreenRecording() {
        
        self.app?.launch()
        self.app?.buttons["Button That Navigates to the Detail Screen"].tap()
        
        let element = self.app?.windows.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element?.tap()
        self.app?.staticTexts["SampleDetailScreen"].tap()
        element?.tap()
        element?.swipeDown()
        element?.swipeUp()
        
        let moviesNavigationBar = self.app?.navigationBars["Movies"]
        moviesNavigationBar?.buttons["Movies"].tap()
        
        let moviesStaticText = moviesNavigationBar?.staticTexts["Movies"]
        moviesStaticText?.tap()
        moviesStaticText?.tap()
        moviesStaticText?.swipeLeft()
        
        let tablesQuery = self.app?.tables
        tablesQuery?.cells.containing(.staticText, identifier:"Section: 0, Index: 0").element.tap()
        tablesQuery?.cells.containing(.staticText, identifier:"Section: 0, Index: 1").element.tap()
        tablesQuery?.cells.containing(.staticText, identifier:"Section: 0, Index: 2").element.swipeUp()
        tablesQuery?.cells.containing(.staticText, identifier:"Section: 0, Index: 4").element.swipeUp()
    }
    
    func testCanScroll() {
        self.app?.launch()

        let tablesQuery = self.app?.tables
        tablesQuery?.cells.containing(.staticText, identifier:"Section: 0, Index: 1").element.tap()

        let testElement = tablesQuery?.cells.containing(.staticText, identifier:"Section: 0, Index: 4").element

        XCTAssertEqual(testElement?.exists, true)
    }
    
}
