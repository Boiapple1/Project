//
//  structjson.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/14/22.
//

import Foundation

//Main link
struct Pokemonapi: Decodable{
    let next: String?
    let previous: String?
    let results: [Pokemon]
    

}

struct Pokemon: Decodable{
    let name: String?
    let url: String
    var details: [PokemonDetail]?
    
}

//Pokemon Link
struct PokemonDetail: Decodable{
    let abilities: [Abilities?]
    let id: Int
    let name: String
    let moves:[Moves]
    let species: Pokemon
    let sprites: Sprites
    let stats:[Stats]
    let types:[Types?]
}


struct Abilities: Decodable{
    let ability: nameandlink
    
}

struct Types: Decodable{
    let slot: Int
    let type: nameandlink
}
struct Moves: Decodable{
    let move: nameandlink
   // let movelink: Movelink?
    

}
struct Sprites: Decodable{
     let frontDefault: String
     let frontShiny: String?
     let frontFemale: String?
     let frontShinyFemale: String?
     let backDefault: String
     let backShiny: String?
     let backFemale: String?
     let backShinyFemale: String?
     let other: others
}
struct Stats: Decodable{
    let base_stat: Int?
    let effort: Int
    let stat: nameandlink
    
}
struct others: Decodable{
    let home: home
}
struct home:Decodable{
    let front_default: String?
}
//link move
struct Movelink: Decodable{
    let effect_entries:[effect]
}
struct effect: Decodable{
    let effect: String
}
struct url: Decodable{
    let url: String
    let specie: Specie
}


//additional details
struct Specie: Decodable{
    let is_baby: Bool
    let is_legendary: Bool
    let is_mythical: Bool
}
struct nameandlink: Decodable{
    let name: String
    let url: String
}

/**
 
 
 https://pokeapi.co/api/v2/pokemon?offset=0&limit=30
 https://pokeapi.co/api/v2/pokemon/1/
 https://pokeapi.co/api/v2/ability/65/
 https://pokeapi.co/api/v2/pokemon-species/1/
 */
 





