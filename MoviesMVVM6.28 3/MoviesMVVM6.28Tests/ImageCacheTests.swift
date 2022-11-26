//
//  ImageCacheTests.swift
//  MoviesMVVM6.28Tests
//
//  Created by iAskedYou2nd on 7/28/22.
//

import XCTest
import UIKit
@testable import MoviesMVVM6_28

class ImageCacheTests: XCTestCase {

    var imageCache: ImageCache?
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        self.imageCache = ImageCache()
    }

    override func tearDownWithError() throws {
        self.imageCache = nil
        try super.tearDownWithError()
    }

    func testCacheKeyNotFound() {
        // Arrange
        let key = "SampleKey"
        
        // Act
        let imageData = self.imageCache?.getImageData(key: key)
        
        // Assert
        XCTAssertNil(imageData)
    }
    
    func testCacheAll() {
        // Arrange
        let key = "SampleKey"
        let sampleImage = UIImage(named: "question-mark")?.jpegData(compressionQuality: 1.0) ?? Data()
        
        // Act
        self.imageCache?.setImageData(data: sampleImage, key: key)
        let pulledImageData = self.imageCache?.getImageData(key: key)
        
        // Assert
        XCTAssertEqual(pulledImageData, sampleImage)
    }
    

}
