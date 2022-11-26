//
//  MockService.swift
//  MoviesMVVM6.28Tests
//
//  Created by iAskedYou2nd on 7/29/22.
//

import Foundation
@testable import MoviesMVVM6_28

class MockService: NetworkService {
    
    
    func getModel<T>(url: URL?, completion: @escaping (Result<T, NetworkError>) -> Void) where T : Decodable {
        
        guard let url = NetworkParams.popularMovies(1).url else {
            completion(.failure(NetworkError.urlFailure))
            return
        }
        
        let mockSession = MockSession()
        mockSession.retrieveData(url: url) { data, response, error in
            
            guard let data = data else {
                completion(.failure(NetworkError.dataFailure))
                return
            }

            do {
                let model = try JSONDecoder().decode(T.self, from: data)
                completion(.success(model))
            } catch {
                print(error)
            }
            
            
        }
        
        
        
        
    }
    
    func getRawData(url: URL?, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
    }

}
