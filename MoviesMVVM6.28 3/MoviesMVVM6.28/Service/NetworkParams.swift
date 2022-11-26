//
//  NetworkParams.swift
//  MoviesMVVM6.28
//
//  Created by iAskedYou2nd on 7/19/22.
//

import Foundation

enum NetworkParams {
    
    private struct NetworkConstants {
        static let popularBase = "https://api.themoviedb.org/3/movie/popular"
        static let baseImage = "https://image.tmdb.org/t/p/w500"
        static let key = "705f7bed4894d3adc718c699a8ca9a4f"
    }
        
    case popularMovies(Int)
    case movieImage(String)
    
    var url: URL? {
        switch self {
        case .popularMovies(let page):
            var component = URLComponents(string: NetworkConstants.popularBase)
            component?.queryItems = [URLQueryItem(name: "api_key", value: NetworkConstants.key),
                                     URLQueryItem(name: "language", value: "en-US"),
                                     URLQueryItem(name: "page", value: "\(page)")]
            return component?.url
        case .movieImage(let posterPath):
            return URL(string: NetworkConstants.baseImage + posterPath)
//            let baseURL = URL(string: NetworkConstants.baseImage)
//            return URL(string: posterPath, relativeTo: baseURL)
        }
    }
    
}
