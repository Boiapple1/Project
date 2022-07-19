//
//  cachelinks.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/19/22.
//

import Foundation

class namelinkCache {
    
    static let shared = namelinkCache()
    
    private let cache1: NSCache<NSString, NSData>
    
    private init() {
        self.cache1 = NSCache<NSString, NSData>()
    }
    
}

extension namelinkCache {
    
    func setnamelinkData(data: Data, key: String) {
        let nsKey = NSString(string: key)
        let object = NSData(data: data)
        self.cache1.setObject(object, forKey: nsKey)
    }
    
    func getnamelinkData(key: String) -> Data? {
        let nsKey = NSString(string: key)
        guard let object = self.cache1.object(forKey: nsKey) else { return nil }
        return Data(referencing: object)
    }
    
}
