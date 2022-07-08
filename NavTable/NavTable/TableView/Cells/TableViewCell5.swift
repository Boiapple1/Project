//
//  TableViewCell5.swift
//  NavTable
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class TableViewCell5: UITableViewCell {

    @IBOutlet weak var imageView5: UIImageView!
    
    @IBOutlet weak var Label5: UILabel!
    
    
    @IBOutlet weak var YearL5: UILabel!
    
    
    @IBOutlet weak var numB5: UIStepper!
    
    var indexPath:IndexPath?
    var value1: Double?
    
    func configure(imageStr:String, name: String){
        self.imageView5.image=UIImage(named: imageStr)
        
        self.Label5.text =  "Animal: \(name)"
        self.YearL5.text = "Number= \(self.numB5.value)"
        
    }
    @IBAction func Numb5(_ sender: UIStepper) {
        self.value1 = sender.value
        self.YearL5.text = "Number= \(sender.value)"
    }
    
    
}
