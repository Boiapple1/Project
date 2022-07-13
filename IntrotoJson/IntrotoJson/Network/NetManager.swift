//
//  NetManager.swift
//  IntrotoJson
//
//  Created by Consultant on 7/12/22.
//

import Foundation

class NetworkManager{
    
    typealias JSONDictionary = [String: Any]
    
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
        
        
        guard let damagerelationdic = base["damage_relations"] as? [String: Any] else {return nil}
        
        guard let double_damage_f = damagerelationdic["double_damage_from"] as? [JSONDictionary] else {return nil}
        var finaldoubledamagef = [nameandlink]()
        double_damage_f.forEach{value in
            guard let doubledamagef = self.nameandlinks(dict: value) else{return}
            finaldoubledamagef.append(doubledamagef)
        }
        guard let double_damage_t = damagerelationdic["double_damage_to"] as? [JSONDictionary] else {return nil}
        var finaldoubledamaget = [nameandlink]()
        double_damage_t.forEach{value in
            guard let doubledamaget = self.nameandlinks(dict: value) else{return}
            finaldoubledamaget.append(doubledamaget)
        }
        guard let half_damage_f = damagerelationdic["half_damage_from"] as? [JSONDictionary] else {return nil}
        var finalhalfdamagef = [nameandlink]()
        half_damage_f.forEach{value in
            guard let halfdamagef = self.nameandlinks(dict: value) else{return}
            finalhalfdamagef.append(halfdamagef)
        }
        
        guard let half_damage_t = damagerelationdic["half_damage_to"] as? [JSONDictionary] else {return nil}
        var finalhalfdamaget = [nameandlink]()
        half_damage_t.forEach{value in
            guard let halfdamaget = self.nameandlinks(dict: value) else{return}
            finalhalfdamaget.append(halfdamaget)
        }
        guard let no_damage_f = damagerelationdic["no_damage_from"] as? [JSONDictionary] else {return nil}
        var finalnodamagef = [nameandlink]()
        no_damage_f.forEach{value in
            guard let nodamagef = self.nameandlinks(dict: value) else{return}
            finalnodamagef.append(nodamagef)
        }
        guard let no_damage_t = damagerelationdic["no_damage_to"] as? [JSONDictionary] else {return nil}
        var finalnodamaget = [nameandlink]()
        no_damage_t.forEach{value in
            guard let nodamaget = self.nameandlinks(dict: value) else{return}
            finalnodamaget.append(nodamaget)
        }
        
        let damages = damagerelations(double_damage_from: finaldoubledamagef, double_damage_to: finaldoubledamaget, half_damage_from: finalhalfdamagef, half_damage_to: finalhalfdamaget, no_damage_from: finalnodamagef, no_damage_to: finalnodamaget)
        
        guard let gameindece = base["game_indices"] as? [JSONDictionary] else {return nil}
        var finalgameindece: [gameindices1] = []
        gameindece.forEach{value in
            guard let gameinvalue = value["game_index"] as? Int else {return}
            guard let genedict = value["generation"] as? JSONDictionary else {return}
            guard let gener = self.nameandlinks(dict: genedict) else {return}
            finalgameindece.append(gameindices1(game_index: gameinvalue, generation: gener))
        }
        
        guard let gener = base["generation"] as? JSONDictionary else {return nil}
        guard let gene = self.nameandlinks(dict: gener) else{return nil}
        
        guard let ids = base["id"] as? Int else {return nil}
        
        guard let moveDamageClassDict = base["move_damage_class"] as? [String: Any] else { return nil }
        guard let movDamageC = self.nameandlinks(dict: moveDamageClassDict) else { return nil}
                                    
        guard let move1 = base["moves"] as? [JSONDictionary] else {return nil}
        var finalmove = [nameandlink]()
        move1.forEach{value in
            guard let n = self.nameandlinks(dict: value) else{return}
            finalmove.append(n)
        }
        
        guard let names = base["name"] as? String else {return nil}
        guard let pok1 = base["pokemon"] as? [JSONDictionary] else {return nil}
        var poke: [pokemon1] = []
        pok1.forEach{value in
            guard let slo = value["slot"] as? Int else {return}
            guard let pokem = value["pokemon"] as? JSONDictionary else {return}
            guard let p = self.nameandlinks(dict: pokem) else {return}
            poke.append(pokemon1(pokemon: p, slot: slo))
        }
        
        return Pokemondragon(damagerelations: damages, game_indices: finalgameindece, generations: gene, id: ids, move_damage_class: movDamageC, move: finalmove, name: names, pokemon: poke)
            
    }

    
    
    private func nameandlinks(dict: [String: Any]) -> nameandlink? {
        guard let name = dict["name"] as? String else { return nil }
        guard let url = dict["url"] as? String else { return nil }
        return nameandlink(name: name, url: url)
    }
    
}
