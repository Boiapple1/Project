//
//  gifcache.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/19/22.
//

import Foundation
class gifCache {
    
    static let shared = gifCache()
    
    private let cache: NSCache<NSString, NSData>
    
    private init() {
        self.cache = NSCache<NSString, NSData>()
    }
    
}

extension gifCache {
    
    func setgifData(data: Data, key: String) {
        let nsKey = NSString(string: key)
        let object = NSData(data: data)
        self.cache.setObject(object, forKey: nsKey)
    }
    
    func getgifData(key: String) -> Data? {
        let nsKey = NSString(string: key)
        guard let object = self.cache.object(forKey: nsKey) else { return nil }
        return Data(referencing: object)
    }
    
}
