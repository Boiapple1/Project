//
//  MockSession.swift
//  MoviesMVVM6.28Tests
//
//  Created by iAskedYou2nd on 7/28/22.
//

import Foundation
@testable import MoviesMVVM6_28

class MockSession: Session {
    
    func retrieveData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        // First Success
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            if url.absoluteString.contains("DataFailure") {
                completion(nil, nil, nil)
            } else if url.absoluteString.contains("GenericFailure"){
                let error = NSError(domain: "Test", code: 0, userInfo: nil)
                completion(nil, nil, error)
            } else if url.absoluteString.contains("StatusCodeFailure"){
                
                let response = HTTPURLResponse(url: url, statusCode: 404, httpVersion: nil, headerFields: nil)
                
                completion(nil, response, nil)
            } else {
                do {
                    let bundle = Bundle(for: MoviesMVVM6_28Tests.self)
                    let path = bundle.path(forResource: "MockMovieData", ofType: "json") ?? ""
                    
                    let jsonData = try Data(contentsOf: URL(fileURLWithPath: path))
                    completion(jsonData, nil, nil)
                } catch {
                    print(error)
                    completion(nil, nil, nil)
                }
            }
        }
        
    }
    
}
