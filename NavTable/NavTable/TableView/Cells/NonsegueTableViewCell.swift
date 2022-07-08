//
//  NonsegueTableViewCell.swift
//  NavTable
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class NonsegueTableViewCell: UITableViewCell {

    @IBOutlet weak var image1: UIImageView!
    

    @IBOutlet weak var Name1: UILabel!
    
    @IBOutlet weak var Info: UILabel!

    func configure1(imageStr:String, AName: String, Info: String){
        
        self.image1.image = UIImage(named: imageStr)
        self.Name1.text = "Name: " + (AName)
        self.Info.text = "Information: " + (Info)
        
    }
    

}
