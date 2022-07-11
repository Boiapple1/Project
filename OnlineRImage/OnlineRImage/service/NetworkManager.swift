//
//  NetworkManager.swift
//  OnlineRImage
//
//  Created by Consultant on 7/11/22.
//

import Foundation

final class NetworkManager{
    
    
    static let shared: NetworkManager = NetworkManager()

    private let session: URLSession
    

    private init(session: URLSession = URLSession.shared){
        self.session = session
        

        
    }
    
    func getData(url: URL?, completion: @escaping (Data?, URLResponse) -> Void){
        


                
        guard let url = url else {return}
        
        self.session.dataTask(with: url){ data, response, error in
//            guard let data = data else {
//                return
//            }
            
            completion(data, response ?? URLResponse())



            
        }.resume()
        
    }


}


