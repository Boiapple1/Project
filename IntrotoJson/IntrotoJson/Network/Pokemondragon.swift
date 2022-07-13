//
//  Pokemondragon.swift
//  IntrotoJson
//
//  Created by Consultant on 7/12/22.
//

import Foundation
struct nameandlink{
    let name: String
    let url: String
    
}
struct Pokemondragon{
    var damagerelations: damagerelations1 
    let game_indices:[gameindices1]
    let generations: nameandlink
    let id: Int
    let move_damage_class: nameandlink
    let move:[moves1]
    let name: String
    let pokemon:[pokemon1]
    
}
struct damagerelations1{
    let double_damage_from:[double_damage_from1]
    let double_damage_to:[double_damage_to1]
    let half_damage_from:[half_damage_from1]
    let half_damage_to:[half_damage_to1]
    let no_damage_from:[no_damage_from1]
}
struct double_damage_from1{
    let double_damage_from: nameandlink
}
struct double_damage_to1{
    let double_damage_to: nameandlink
}
struct half_damage_from1{
    let half_damage_from: nameandlink
}
struct half_damage_to1{
    let half_damage_to: nameandlink
}
struct no_damage_from1{
    
}
struct no_damage_to{
    let no_damage_to: nameandlink
}

struct gameindices1{
    let game_indices: Int
    let generation: [generation1]
    
}
struct generation1{
    let generation: nameandlink
}

struct moves1{
    let moves1: nameandlink
}
struct pokemon1{
    let pokemon1:[pokemon2]
    let slot: Int
}
struct pokemon2{
    let pokemon2: nameandlink
}


