//
//  MovieViewModel.swift
//  MoviesMVVM6.28
//
//  Created by iAskedYou2nd on 7/20/22.
//

import Foundation

protocol MovieViewModelCore {
    func bind(updateHandler: @escaping () -> Void)
    func getMovies()
}

protocol MovieViewModelAttributes {
    var count: Int { get }
    func movieTitle(for index: Int) -> String?
    func movieImage(for index: Int, completion: @escaping (Data?) -> Void)
}

typealias MovieViewModelType = MovieViewModelCore & MovieViewModelAttributes

class MovieViewModel {
    
    private var movies: [Movie] = [] {
        didSet {
            print("Test: 5")
            self.updateHandler?()
        }
    }
    private var networkManager: NetworkService
    private var pageCount = 1
    private let cache: ImageCache
    
    private var updateHandler: (() -> Void)?
    
    init(networkManager: NetworkService, cache: ImageCache = ImageCache()) {
        self.networkManager = networkManager
        self.cache = cache
    }
    
}

extension MovieViewModel: MovieViewModelCore {
    
    func bind(updateHandler: @escaping () -> Void) {
        self.updateHandler = updateHandler
    }
    
    func getMovies() {
        
        self.networkManager.getModel(url: NetworkParams.popularMovies(self.pageCount).url) { (result: Result<MoviePage, NetworkError>) in
            switch result {
            case .success(let page):
                self.pageCount += 1
                print("Test: 4")
                self.movies.append(contentsOf: page.results)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}


extension MovieViewModel: MovieViewModelAttributes {
    
    var count: Int {
        return self.movies.count
    }
    
    func movieTitle(for index: Int) -> String? {
        guard index < self.count else { return nil }
        return self.movies[index].title
    }
    
    func movieImage(for index: Int, completion: @escaping (Data?) -> Void) {
        
        guard index < self.count else {
            completion(nil)
            return
        }
        
        let posterPath = self.movies[index].posterPath
        
        // Check ImageCache
        if let imageData = self.cache.getImageData(key: posterPath) {
            completion(imageData)
            return
        }
        
        // Else call network
        self.networkManager.getRawData(url: NetworkParams.movieImage(posterPath).url) { result in
            switch result {
            case .success(let imageData):
                self.cache.setImageData(data: imageData, key: posterPath)
                completion(imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
}
