//
//  TableViewCell2.swift
//  NavTable
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class TableViewCell2: UITableViewCell {



    @IBOutlet weak var numB2: UIStepper!
    @IBOutlet weak var LabelY2: UILabel!

    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var imageView2: UIImageView!
    var indexPath:IndexPath?
    var value1: Double?
    func configure(imageStr:String, name: String){
        self.imageView2.image=UIImage(named: imageStr)
        
        self.Label2.text =  "Animal: \(name)"
        self.LabelY2.text = "Number= \(self.numB2.value)"
        
    }
    
    
    @IBAction func NumB22(_ sender: UIStepper) {
        self.value1 = sender.value
        self.LabelY2.text = "Number= \(sender.value)"
        
    }
}
