//
//  PokemonDetail.swift
//  PokemonApp
//
//  Created by Consultant on 7/17/22.
//

import Foundation

struct PokemonDetails: Decodable {
    let id: Int
    let name: String
    let weight: Int
    let height: Int
    let baseExperience: Int
    let forms: [NameandLink]
    let sprite: Sprite
    let abilities: [Ability]
    let moves: [Move]
    let types: [Type]
    let stats: [Stat]
    
    private enum CodingKeys: String, CodingKey {
        case id, name, weight, height, forms, abilities, moves, types, stats
        case baseExperience = "base_experience"
        case sprite = "sprites"
    }
}

struct Sprite: Decodable {
    let url: String
    
    private enum CodingKeys: String, CodingKey {
        case url = "front_default"
    }
}

struct Ability: Decodable {
    let ability: NameandLink
}

struct Move: Decodable {
    let move: NameandLink
}

struct Type: Decodable {
    let type: NameandLink
}

struct Stat: Decodable {
    let baseStat: Int
    let stat: NameandLink
    
    private enum CodingKeys: String, CodingKey {
        case stat
        case baseStat = "base_stat"
    }
}
