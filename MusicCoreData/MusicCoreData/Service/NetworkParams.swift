//
//  NetworkParams.swift
//  MusicCoreData
//
//  Created by Consultant on 7/23/22.
//

import Foundation

enum NetworkParams {
    
    private struct NetworkConstants {
        static let popularBase = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/100/albums.json"
//        static let baseImage = "https://image.tmdb.org/t/p/w500"
       
    }
    
    
    case TopMusic
    case MusicImage(String)
    
    var url: URL? {
        switch self {
        case .TopMusic:
            let component = URL(string: NetworkConstants.popularBase)
    
            return component
        case .MusicImage(let musicimage):
            return URL(string: musicimage)

        }
    }
    
}

