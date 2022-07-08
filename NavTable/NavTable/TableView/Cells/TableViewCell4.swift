//
//  TableViewCell4.swift
//  NavTable
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class TableViewCell4: UITableViewCell {

    @IBOutlet weak var imageView4: UIImageView!
    
    @IBOutlet weak var Label4: UILabel!
    
    @IBOutlet weak var YearL4: UILabel!
    
    @IBOutlet weak var numB4: UIStepper!
    
    var indexPath:IndexPath?
    var value1: Double?
    func configure(imageStr:String, name: String){
        self.imageView4.image=UIImage(named: imageStr)
        
        self.Label4.text =  "Animal: \(name)"
        self.YearL4.text = "Number= \(self.numB4.value)"
        
    }
    
    @IBAction func Numb4(_ sender: UIStepper) {
        self.value1 = sender.value
        self.YearL4.text = "Number= \(sender.value)"
    }
    
}
