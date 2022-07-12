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
 
    
    
    func getData(url: URL?, completion: @escaping (Data?) -> Void){
        var an:String?
        var urlcell:String?
        
        guard let url = url else {return}
        
        self.session.dataTask(with: url){data, response, error in
            let httpResponse = response as? HTTPURLResponse
            
            an = httpResponse?.value(forHTTPHeaderField: "picsum-id")
            urlcell = response?.url?.absoluteString ?? ""
            Linkandid.inf = .init(link: urlcell ?? "", id: an ?? "")
            
            completion(data)
            
        }.resume()
        
    }


}

struct Linkandid {
    let link: String
    let id: String
    
}

extension Linkandid{
    static var inf = Linkandid(link:"", id: "")
}


