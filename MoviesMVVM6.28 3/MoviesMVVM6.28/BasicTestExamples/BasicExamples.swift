//
//  BasicExamples.swift
//  MoviesMVVM6.28
//
//  Created by iAskedYou2nd on 7/28/22.
//

import Foundation


class BasicExamples {
    
    func add<T: Numeric>(lhs: T, rhs: T) -> T {
        return lhs + rhs
    }
    
    func multiply<T: Numeric>(lhs: T, rhs: T) -> T {
        return lhs * rhs
    }
    
    func delayedAdd<T: Numeric>(lhs: T, rhs: T, completion: @escaping (T) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            completion(lhs + rhs)
        }
    }
    
    
}
