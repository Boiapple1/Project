//
//  PokemonAPI.swift
//  PokemonApp
//
//  Created by Consultant on 7/17/22.
//

import Foundation

struct Pokemonapi: Decodable{
    let next: String?
    let previous: String?
    let results: [NameandLink]
    

}
