//
//  cachelinks.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/19/22.
//

import Foundation

class namelinkCache {
    
    static let shared = namelinkCache()
    
    private let cache1: NSCache<NSString, NSString>
    
    private init() {
        self.cache1 = NSCache<NSString, NSString>()
    }
    
}

extension namelinkCache {
    
    func setnamelinkData(data: String, key: String) {
        let nsKey = NSString(string: key)
        let object = NSString(string: data)
        self.cache1.setObject(object, forKey: nsKey)
    }
    
    func getnamelinkData(key: String) -> String? {
        let nsKey = NSString(string: key)
        guard let object = self.cache1.object(forKey: nsKey) else { return nil }
        return String(object)
    }
    
}
