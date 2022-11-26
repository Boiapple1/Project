//
//  NetworkError.swift
//  MoviesSwiftUI6.28
//
//  Created by iAskedYou2nd on 8/18/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case invalidStatusCode(Int)
    case generalError(Error)
}
