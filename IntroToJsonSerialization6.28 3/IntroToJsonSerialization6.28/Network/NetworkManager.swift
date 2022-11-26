//
//  NetworkManager.swift
//  IntroToJsonSerialization6.28
//
//  Created by iAskedYou2nd on 7/12/22.
//

import Foundation

class NetworkManager {
    
    
    func getPokemonManually() -> Pokemon? {
        
        guard let path = Bundle.main.path(forResource: "Glaceon", ofType: "json") else { return nil }
        
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let jsonObj = try JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            guard let baseDict = jsonObj as? [String: Any] else { return nil }
            return parsePokemonManually(base: baseDict)
        } catch {
            print(error)
        }
        
        return nil
    }
    
    
    private func parsePokemonManually(base: [String: Any]) -> Pokemon? {
        
        guard let abilitiesArr = base["abilities"] as? [[String: Any]] else { return nil }
        
        // Abilities
        var finalAbilites: [Ability] = []
        abilitiesArr.forEach { value in
            guard let abilityDict = value["ability"] as? [String: Any] else { return }
            guard let abilityRep = self.createNameLink(dict: abilityDict) else { return }
            guard let isHidden = value["is_hidden"] as? Bool else { return }
            guard let slot = value["slot"] as? Int else { return }
            finalAbilites.append(Ability(ability: abilityRep, isHidden: isHidden, slot: slot))
        }
        
        
        guard let baseExperience = base["base_experience"] as? Int else { return nil }
        
        guard let formsArr = base["forms"] as? [[String: Any]] else { return nil }
        var finalForms: [NameLink] = []
        formsArr.forEach { value in
            guard let form = self.createNameLink(dict: value) else { return }
            finalForms.append(form)
        }
        
        guard let gameIndicesArr = base["game_indices"] as? [[String: Any]] else { return nil }
        var finalGameIndices: [GameIndex] = []
        gameIndicesArr.forEach{ value in
            guard let gameIndex = value["game_index"] as? Int else { return }
            guard let version = value["version"] as? [String: Any] else { return }
            guard let returnVersion = self.createNameLink(dict: version) else { return }
            finalGameIndices.append(GameIndex(gameIndex: gameIndex, version: returnVersion))
        }
        
        guard let height = base["height"] as? Int else { return  nil }
        guard let id = base["id"] as? Int else { return nil }
        guard let isDefault = base["is_default"] as? Bool else { return nil }
        guard let locationAreaEncounters = base["location_area_encounters"] as? String else { return nil }
        
        guard let movesArr = base["moves"] as? [[String: Any]] else { return nil }
        var finalMoves: [Move] = []
        movesArr.forEach { value in
            guard let moveDict = value["move"] as? [String: Any] else { return }
            guard let moveRep = self.createNameLink(dict: moveDict) else { return }
            finalMoves.append(Move(move: moveRep))
        }
        
        guard let name = base["name"] as? String else { return nil }
        guard let order = base["order"] as? Int else { return nil }
        
        guard let speciesDict = base["species"] as? [String: Any] else { return nil }
        guard let species = self.createNameLink(dict: speciesDict) else { return nil }
        
        guard let spritesDict = base["sprites"] as? [String: Any] else { return nil }
        let backDefault = spritesDict["back_default"] as? String
        let backFemale = spritesDict["back_female"] as? String
        let backShiny = spritesDict["back_shiny"] as? String
        let backShinyFemale = spritesDict["back_shiny_female"] as? String
        let frontDefault = spritesDict["front_default"] as? String
        let frontFemale = spritesDict["front_female"] as? String
        let frontShiny = spritesDict["front_shiny"] as? String
        let frontShinyFemale = spritesDict["front_shiny_female"] as? String
        let sprites = Sprites(backDefault: backDefault, backFemale: backFemale, backShiny: backShiny, backShinyFemale: backShinyFemale, frontDefault: frontDefault, frontFemale: frontFemale, frontShiny: frontShiny, frontShinyFemale: frontShinyFemale)

        guard let statArr = base["stats"] as? [[String: Any]] else { return nil }
        var finalStats: [Stats] = []
        statArr.forEach{ value in
            guard let baseStat = value["base_stat"] as? Int else { return }
            guard let effort = value["effort"] as? Int else { return }
            guard let statDict = value["stat"] as? [String: Any] else { return }
            guard let statNameLink = self.createNameLink(dict: statDict) else { return }
            finalStats.append(Stats(baseStat: baseStat, effort: effort, stat: statNameLink))
        }
        
        guard let typesArr = base["types"] as? [[String: Any]] else { return nil }
        var finalTypes: [LiteralType] = []
        typesArr.forEach{ value in
            guard let slot = value["slot"] as? Int else { return }
            guard let typeDict = value["type"] as? [String: Any] else { return }
            guard let typeNameLink = self.createNameLink(dict: typeDict) else { return }
            finalTypes.append(LiteralType(slot: slot, type: typeNameLink))
         }
        
        guard let weight = base["weight"] as? Int else  { return nil }
        
        return Pokemon(abilities: finalAbilites, baseExperience: baseExperience, forms: finalForms, gameIndices: finalGameIndices, height: height, id: id, isDefault: isDefault, locationAreaEncounters: locationAreaEncounters, moves: finalMoves, name: name, order: order, species: species, sprites: sprites, stats: finalStats, types: finalTypes, weight: weight)
    }
    
    private func createNameLink(dict: [String: Any]) -> NameLink? {
        guard let name = dict["name"] as? String else { return nil }
        guard let url = dict["url"] as? String else { return nil }
        return NameLink(name: name, url: url)
    }
    
    
}

