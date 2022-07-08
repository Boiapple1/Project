//
//  TableViewCell1.swift
//  NavTable
//
//  Created by Consultant on 7/6/22.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var imageAni: UIImageView!
    
    
    @IBOutlet weak var LabelName: UILabel!
    
 
    @IBOutlet weak var years: UILabel!
    
    @IBOutlet weak var NumbB: UIStepper!
    
    var indexPath:IndexPath?
    var value1: Double?
    func configure(imageStr:String, Name: String){
        
        self.imageAni.image=UIImage(named: imageStr)
        
        self.LabelName.text =  "Animal: \(imageStr)"
        self.years.text = "Number= \(self.NumbB.value)"
    }
    
    @IBAction func NumB(_ sender: UIStepper) {
        self.value1 = sender.value
        self.years.text = "Number= \(sender.value)"
        
    }
    
}
