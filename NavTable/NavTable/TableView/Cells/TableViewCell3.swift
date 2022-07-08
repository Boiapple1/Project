//
//  TableViewCell3.swift
//  NavTable
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class TableViewCell3: UITableViewCell {

    @IBOutlet weak var imageView3: UIImageView!
 
    @IBOutlet weak var Label3: UILabel!
    
    @IBOutlet weak var YearL3: UILabel!
    
    
    @IBOutlet weak var numB3: UIStepper!
    
    var indexPath:IndexPath?
    var value1: Double?
    func configure(imageStr:String, name: String){
        self.imageView3.image=UIImage(named: imageStr)

        self.Label3.text =  "Animal: \(name)"
        self.YearL3.text = "Number= \(self.numB3.value)"
        
    }
    @IBAction func Numb3(_ sender: UIStepper) {
        self.value1 = sender.value
        self.YearL3.text = "Number= \(sender.value)"
    }
    
    
}
