//
//  NetworkParams.swift
//  SwiftUIProject
//
//  Created by Consultant on 8/21/22.
//


import Foundation

enum NetworkParams {
    
    private struct NetworkConstants {
        static let zooanimals = "https://zoo-animal-api.herokuapp.com/animals/rand/10"
    }
    
    case ZooAnimals
    case AnimalPic(String)
    
    
    var url: URL? {
        switch self {
        case .ZooAnimals:
            let components = URLComponents(string: NetworkConstants.zooanimals)
            return components?.url

        case .AnimalPic(let path):
            return URL(string: path)
        }
    }
    
    
}
