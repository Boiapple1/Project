//
//  NasaViewModel.swift
//  NasaPhotosTests
//
//  Created by Consultant on 8/6/22.
//

import XCTest

@testable import NasaPhotos

class NasaViewModelTest: XCTestCase {

    var viewModel: NasaViewModel?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.viewModel = NasaViewModel()
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
        self.viewModel?.fetchNasainfo()
        wait(for: [expectation], timeout: 400000)
        
        XCTAssert(((self.viewModel?.copyright(for: 0)) != nil))
        // Assert
        XCTAssert(((self.viewModel?.count) != nil))
        
        XCTAssert(((self.viewModel?.title(for: 0)) != nil))
        XCTAssert(((self.viewModel?.date(for: 0)) != nil))
        XCTAssert(((self.viewModel?.explanation(for: 0)) != nil))
        XCTAssert((((self.viewModel?.image(for: 0, completion: {image in
        }))) != nil))
        
    }


}
