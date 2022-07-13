//
//  Pokemondragon.swift
//  IntrotoJson
//
//  Created by Consultant on 7/12/22.
//

import Foundation

struct Pokemondragon{
    var damagerelations: damagerelations
    let game_indices:[gameindices1]
    let generations: nameandlink
    let id: Int
    let move_damage_class: nameandlink
    let move:[nameandlink]
    let name: String
    let pokemon:[pokemon1]
    
}
struct damagerelations{
    let double_damage_from: [nameandlink]
    let double_damage_to:[nameandlink]
    let half_damage_from:[nameandlink]
    let half_damage_to:[nameandlink]
    let no_damage_from:[Any?]
    let no_damage_to:[nameandlink]
}
struct nameandlink{
    let name: String
    let url: String
    
}

struct gameindices1{
    let game_index: Int
    let generation: nameandlink
    
}

struct pokemon1{
    let pokemon:nameandlink
    let slot: Int
}


