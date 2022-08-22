//
//  NasaViewModel.swift
//  NasaPhotos
//
//  Created by Consultant on 8/6/22.
//

import Foundation
import UIKit
@objcMembers
class NasaViewModel : NSObject{
    private let networkManager: NetworkManager
    private var fDate: Any?
    private var n = 0
    private var fromDate = Calendar.current.date(byAdding: .day, value: 0, to: Date())
    
    private var endDate = Calendar.current.date(byAdding: .day, value: -5, to: Date())
    
    private var nasa: [Nasa] = []{
        didSet{
            self.updateHandler?()
            
        }
        
    }

    private var updateHandler: (() -> Void)?
    
    @objc
    init(networkManager: NetworkManager = NetworkManager.sharedInstance()){
        self.networkManager = networkManager
    }
    @objc
    func bind(updateHandler: @escaping () -> Void){
        self.updateHandler = updateHandler
    }
    
    @objc
    public func fetchNasainfo(){
        if n == 0{
            
        var date = endDate// first date
        let endDate = Date()  // last date

        // Formatter for printing the date, adjust it according to your needs:
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"

        while date ?? Date() <= endDate {
            print(fmt.string(from: date ?? Date()))
            let a = fmt.string(from: date ?? Date())
            self.networkManager.fetchNasa(a){ [weak self] (nasa: Nasa?) in
                guard let nasa = nasa as Nasa? else {return}

                    
           
                    self?.nasa.append(nasa)
                    self?.nasa = self?.nasa.sorted(by: {$0.date.compare($1.date) == .orderedDescending}) ?? []


            }

            date = Calendar.current.date(byAdding: .day, value: 1, to: date ?? Date())
        }
            n = -6
            
            
        }else{
        self.fDate = Calendar.current.date(byAdding: .day, value: n, to: Date())
        
        let fmt = DateFormatter()
        fmt.dateFormat = "yyyy-MM-dd"
        let a = fmt.string(from: self.fDate as? Date ?? Date())
        self.networkManager.fetchNasa(a){ [weak self] (nasa: Nasa?) in
            guard let nasa = nasa as Nasa? else {return}
           
                self?.nasa.append(nasa)
    }
        n = n - 1
        }
 
 

    }
    
    var count: Int{
        
        return self.nasa.count
    }

    
    func copyright(for index: Int) -> String? {
        guard index < self.nasa.count else {return nil}
        return self.nasa[index].copyright
    }
    
    func date(for index: Int) -> String? {
        guard index < self.nasa.count else {return nil}
        let fmt = DateFormatter()
        fmt.dateFormat = "MM-dd-yyyy"
//        var a = fmt.string(from: "\(self.nasa[index].date)")
      

        return self.nasa[index].date
    }
    
    func explanation(for index: Int) -> String? {
        guard index < self.nasa.count else {return nil}
        return self.nasa[index].explanation
    }
    
    func title(for index: Int) -> String? {
        guard index < self.nasa.count else {return nil}
        return self.nasa[index].title
    }
    
    func urlImage(for index: Int) -> String? {
        guard index < self.nasa.count else {return nil}
        return self.nasa[index].url
    }
    
    func image(for index: Int, completion: @escaping (UIImage?) -> Void) {
        guard index < self.nasa.count else {
            completion(nil)
            return
        }

        self.networkManager.fetchNasaImage(self.nasa[index].url) { (image: UIImage?) in
            DispatchQueue.main.async {
                completion(image)
            }
            
        }
    }
    
    
}




