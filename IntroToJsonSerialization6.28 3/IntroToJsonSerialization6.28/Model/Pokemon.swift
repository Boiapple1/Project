//
//  Pokemon.swift
//  IntroToJsonSerialization6.28
//
//  Created by iAskedYou2nd on 7/12/22.
//

import Foundation

struct Pokemon {
    
    let abilities: [Ability]
    let baseExperience: Int
    let forms: [NameLink]
    let gameIndices: [GameIndex]
    let height: Int
    let id: Int
    let isDefault: Bool
    let locationAreaEncounters: String
    let moves: [Move]
    let name: String
    let order: Int
    let species: NameLink
    let sprites: Sprites
    let stats: [Stats]
    let types: [LiteralType]
    let weight: Int
}

struct Ability {
    
    let ability: NameLink
    let isHidden: Bool
    let slot: Int
}

struct GameIndex {
    let gameIndex: Int
    let version: NameLink
}

struct Move {
    let move: NameLink
}

struct Sprites {
    let backDefault: String?
    let backFemale: String?
    let backShiny: String?
    let backShinyFemale: String?
    let frontDefault: String?
    let frontFemale: String?
    let frontShiny: String?
    let frontShinyFemale: String?
}

struct Stats {
    let baseStat: Int
    let effort: Int
    let stat: NameLink
}

struct LiteralType {
    let slot: Int
    let type: NameLink
}

struct NameLink {
    let name: String
    let url: String
}
