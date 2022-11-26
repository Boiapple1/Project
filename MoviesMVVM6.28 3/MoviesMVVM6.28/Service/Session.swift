//
//  GenericService.swift
//  MoviesMVVM6.28
//
//  Created by iAskedYou2nd on 7/28/22.
//

import Foundation

protocol Session {
    func retrieveData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

extension URLSession: Session {
    
    func retrieveData(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        self.dataTask(with: url) { data, response, error in
            completion(data, response, error)
        }.resume()
    }
    
}
