//
//  NetworkManager.swift
//  PokemonApp
//
//  Created by Consultant on 7/17/22.
//

//
//  NetworkM.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/15/22.
//
import Foundation
enum Endpoint {
    case pokemonList(offset: Int, limit: Int)
    case pokemon(id: String)

    var path: String {
        switch self {
            case .pokemonList(let offset, let limit):
                return "/pokemon/?offset=\(offset)&limit=\(limit)"
            case .pokemon(let id):
                return "/pokemon/\(id)"
        }
    }
}


final class NetworkManager{
    static let shared: NetworkManager = NetworkManager()



    private let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
        
        
    }
 
}






extension NetworkManager{
    
    func getPokemonList(endpoint: Endpoint, callback: @escaping (Result<Pokemonapi, NetworkError>) -> Void) {
        guard let url = URL(string: "https://pokeapi.co/api/v2\(endpoint.path)") else {
            callback(.failure(.dataFailure))
            return
        }

        let task = session.dataTask(with: url) { data, response, error in

            // Check that we didn't screw up.
            if let error = error {
                callback(.failure(.other(error.localizedDescription as! Error)))
                return
            }

            // Check that the response is an HTTP response (i.e., web).
            guard let httpResp = response as? HTTPURLResponse else {
                callback(.failure(.other("Not a HTTP response" as! Error)))
                return
            }

            // Check that we got the "OK" response code (~200).
            guard (200..<300).contains(httpResp.statusCode) else {
                callback(.failure(.urlFailure))
                return
            }

            // Check that the data isn't nil.
            guard let data = data else {
                callback(.failure(.urlFailure))
                return
            }

            // Make a decoder...
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            // ... and try to decode that data!
            do {
                let result = try decoder.decode(Pokemonapi.self, from: data)
                callback(.success(result))
            } catch {
                callback(.failure(.decodeError(error)))
                return
            }
        }
        task.resume()
    }

    func getPokemon(url: String, callback: @escaping (Result<PokemonDetails, NetworkError>) -> Void) {
        guard let url = URL(string: "\(url)") else {
            callback(.failure(.urlFailure))
            return
        }

        let task = session.dataTask(with: url) { data, response, error in

            // Check that we didn't screw up.
            if let error = error {
                callback(.failure(.other(error)))
                return
            }

            // Check that the response is an HTTP response (i.e., web).
            guard let httpResp = response as? HTTPURLResponse else {
                callback(.failure(.urlFailure))
                return
            }

            // Check that we got the "OK" response code (~200).
            guard (200..<300).contains(httpResp.statusCode) else {
                callback(.failure(.urlFailure))
                return
            }

            // Check that the data isn't nil.
            guard let data = data else {
                callback(.failure(.dataFailure))
                return
            }

            // Make a decoder...
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            // ... and try to decode that data!
            do {
                let result = try decoder.decode(PokemonDetails.self, from: data)
                callback(.success(result))
            } catch {
                callback(.failure(.decodeError(error)))
                return
            }
        }
        task.resume()
    }
    
    
    func fetchImageData(urlStr: URL?, completion: @escaping (Data?) -> Void) {

        guard let url2 =  urlStr else {return}

        self.session.dataTask(with: url2) { data, response, error in



            completion(data)

        }.resume()


        }

    
}
