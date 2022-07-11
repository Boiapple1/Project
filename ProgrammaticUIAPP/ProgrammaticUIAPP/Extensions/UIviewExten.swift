//
//  UIviewExten.swift
//  ProgrammaticUIAPP
//
//  Created by Consultant on 7/9/22.
//

import UIKit
extension UIView{
    
    func bindToSuperView(insets: CGFloat = 8){
        guard let superSafeArea = self.superview?.safeAreaLayoutGuide else{
            fatalError("You forgot to add view to the view hiearchy")
        }
        self.topAnchor.constraint(equalTo: superSafeArea.topAnchor, constant: insets).isActive = true
        self.leadingAnchor.constraint(equalTo: superSafeArea.leadingAnchor, constant: insets).isActive = true
        self.trailingAnchor.constraint(equalTo: superSafeArea.trailingAnchor,constant: -insets).isActive = true
        self.bottomAnchor.constraint(equalTo: superSafeArea.bottomAnchor, constant: -insets).isActive = true
        
    }
        
}
