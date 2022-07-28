//
//  StructJson.swift
//  MusicCoreData
//
//  Created by Consultant on 7/22/22.
//

import Foundation

struct topmusic: Decodable{
    let feed: Feed
}
struct Feed: Decodable{
    var results: [Results]
}
struct Results: Decodable{
    let artistName: String
    let name: String
    let releaseDate: String
    let artworkUrl100: String
    let genres: [Genres]
}
struct Genres: Decodable{
    let name: String
    
}
