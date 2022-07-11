//
//  ButtonTableViewCell.swift
//  ProgrammaticUIAPP
//
//  Created by Consultant on 7/9/22.
//

import UIKit

class ButtonTableViewCell: UITableViewCell {
    static let reuseId1 = "\(ButtonTableViewCell.self)"
    
    lazy var NumbC: UIStepper = {
        let NumbC = UIStepper(frame: .zero)
        NumbC.contentVerticalAlignment = .center
        NumbC.contentHorizontalAlignment = .center
        NumbC.translatesAutoresizingMaskIntoConstraints = false
        NumbC.backgroundColor = .systemPurple
        
        return NumbC
        
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemCyan
        self.SetupB()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func SetupB(){

        
            self.addSubview(self.NumbC)
        NumbC.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            NumbC.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 150).isActive = true
            NumbC.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -150).isActive = true
            NumbC.heightAnchor.constraint(equalToConstant: 35).isActive = true
  

        
    }

}
