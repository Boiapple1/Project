//
//  MoviesViewModel.swift
//  MoviesWithObjc6.28
//
//  Created by iAskedYou2nd on 8/4/22.
//

import UIKit

@objcMembers
class MoviesViewModel: NSObject {
    
    private let networkManager: NetworkManager
    private var movies: [Movie] = [] {
        didSet {
            self.updateHandler?()
        }
    }
    
    private var currentPage: PageResult?
    private var updateHandler: (() -> Void)?
    
    @objc
    init(networkManager: NetworkManager = NetworkManager.sharedInstance()) {
        self.networkManager = networkManager
    }
    
    @objc
    func bind(updateHandler: @escaping () -> Void) {
        self.updateHandler = updateHandler
    }
    
    @objc
    func fetchMoviePage() {
        
        var pageNumber = 1
        if let pageN = self.currentPage?.page {
            pageNumber = pageN + 1
        }
        
        self.networkManager.fetchMovies(withPageNumber: pageNumber) { [weak self] (pageResult: PageResult?) in
            // unowned -> let
            // weak -> var
            self?.currentPage = pageResult
            guard let movies = pageResult?.movies as? [Movie] else { return }
            self?.movies.append(contentsOf: movies)
        }
    }
    
    var count: Int {
        return self.movies.count
    }
    
    func title(for index: Int) -> String? {
        guard index < self.movies.count else { return nil }
        return self.movies[index].title
    }
    
    func image(for index: Int, completion: @escaping (UIImage?) -> Void) {
        guard index < self.movies.count else {
            completion(nil)
            return
        }

        self.networkManager.fetchImage(with: self.movies[index].posterImage) { (image: UIImage?) in
            completion(image)
        }
    }
    
    func example() -> (Int, String) {
        return (5, "Hello")
    }
    
}

extension MoviesViewModel {
    
    @objc
    func exampleToObjc() -> TupleSubstitute {
        let tuple = self.example()
        return TupleSubstitute(num: tuple.0, str: tuple.1)
    }
    
}

class TupleSubstitute: NSObject {
    
    let number: Int
    let str: String
    
    init(num: Int, str: String) {
        self.number = num
        self.str = str
    }
    
}

extension NetworkManager {
    
    @objc
    func doSomething() {
        
    }
    
}

