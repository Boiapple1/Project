//
//  AnimalDescription.swift
//  NavTable
//
//  Created by Consultant on 7/7/22.
//

import Foundation

struct AnimalDescription {
    let name: String
    let imageName: String
    let info: String
}

extension AnimalDescription {
    static let bear = AnimalDescription(name: "Bear", imageName: "Bear", info: """
    Bears are carnivoran mammals of the family Ursidae. They are classified as caniforms, or doglike carnivorans. Although only eight species of bears are extant, they are widespread, appearing in a wide variety of habitats throughout the Northern Hemisphere and partially in the Southern Hemisphere.
""")
    static let Giraffe = AnimalDescription(name: "Giraffe", imageName:"gif" , info: """
    The giraffe is a tall African hoofed mammal belonging to the genus Giraffa. It is the tallest living terrestrial animal and the largest ruminant on Earth. Traditionally, giraffes were thought to be one species, Giraffa camelopardalis, with nine subspecies.

    """)
    static let Elephants = AnimalDescription(name: "Elephants", imageName: "ele", info: """
    African elephants are a genus comprising two living elephant species, the African bush elephant and the smaller African forest elephant. Both are social herbivores with grey skin, but differ in the size and colour of their tusks and in the shape and size of their ears and skulls.

    """)
    static let Duck = AnimalDescription(name: "Ducks", imageName: "ducks", info: """
    Duck is the common name for numerous species of waterfowl in the family Anatidae. Ducks are generally smaller and shorter-necked than swans and geese, which are members of the same family.

    """)
    
    static let Panda = AnimalDescription(name: "Panda", imageName: "panda", info: """
    The giant panda, also known as the panda bear, is a bear species endemic to China. It is characterised by its bold black-and-white coat and rotund body. The name "giant panda" is sometimes used to distinguish it from the red panda, a neighboring musteloid.

    """)
    
    

}
