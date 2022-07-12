//
//  savedata.swift
//  OnlineRImage
//
//  Created by Consultant on 7/12/22.
//

import Foundation
final class savedata{
    
    static let share1: savedata = savedata()
    
    var dic1:[Int?:String?] = [:]
    
    func saved(dic:[Int?:String?] ){
        dic1 = dic
        
    }
}
    

