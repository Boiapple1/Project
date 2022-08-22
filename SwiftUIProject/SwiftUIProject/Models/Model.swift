//
//  Model.swift
//  SwiftUIProject
//
//  Created by Consultant on 8/21/22.
//

import Foundation

struct animals: Decodable{
    let name: String
    let latinName: String
    let animalType: String
    let activeTime: String
    let lengthMin: String
    let lengthMax:  String
    let weightMin: String
    let weightMax: String
    let lifespan: String
    let habitat: String
    let diet: String
    let geoRange: String
    let imageLink: String
    let id: Int
    enum CodingKeys: String, CodingKey {
        case latinName = "latin_name"
        case animalType = "animal_type"
        case activeTime = "active_time"
        case lengthMin = "length_min"
        case lengthMax = "length_max"
        case weightMin = "weight_min"
        case weightMax = "weight_max"
        case geoRange = "geo_range"
        case imageLink = "image_link"
        case lifespan, name, habitat, diet, id
    }
    
}
