//
//  CollectionViewCell.swift
//  NavTable
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var Plantime: UILabel!
    @IBOutlet weak var PlantName: UILabel!
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var TimeB: UIStepper!
    var valuet:Double?
    func configplant(imageStr: String,Pname: String){
        self.imageView.image = UIImage(named: imageStr)
        self.PlantName.text = "Name: " + Pname
        self.Plantime.text = "Time: \(self.TimeB.value)"
        
        
    }

    @IBAction func TimeCP(_ sender: UIStepper) {
        self.valuet = sender.value
        self.Plantime.text = "Time: \(sender.value)"
        
    }
    
}
