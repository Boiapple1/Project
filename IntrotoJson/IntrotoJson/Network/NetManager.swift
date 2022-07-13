//
//  NetManager.swift
//  IntrotoJson
//
//  Created by Consultant on 7/12/22.
//

import Foundation

class NetworkManager{
    func getinformation() ->Pokemondragon?{
        guard let path = Bundle.main.path(forResource: "HW", ofType: "json") else{return nil}
        do{
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let jsonObj = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            guard let baseDict = jsonObj as? [String:Any] else {return nil}
            return parsePokemonManually(base: baseDict)
            
        }catch{
            print(error)
            
        }
        return nil
        
    }
    private func parsePokemonManually(base: [String: Any]) ->Pokemondragon?{
        return nil
        
        guard let damagerelationdic = base["damage_relations"] as? [String: Any] else {return nil}
        var finaldamagerelationdic: 
                
        
    
    }
    
    private func nameandlinks(dict: [String: Any]) -> nameandlink? {
        guard let name = dict["name"] as? String else { return nil }
        guard let url = dict["url"] as? String else { return nil }
        return nameandlink(name: name, url: url)
    }
    
}
