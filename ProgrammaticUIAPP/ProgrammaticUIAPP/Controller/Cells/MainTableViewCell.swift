//
//  MainTableViewCell.swift
//  ProgrammaticUIAPP
//
//  Created by Consultant on 7/8/22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let reuseId = "\(MainTableViewCell.self)"
  
    
    lazy var TImageview: UIImageView={
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    
    lazy var LabelName: UILabel = {
        let labelN = UILabel(frame: .zero)
        labelN.translatesAutoresizingMaskIntoConstraints = false
        labelN.numberOfLines = 0
        labelN.backgroundColor = .systemYellow
        return labelN
        
    }()
    
    lazy var LabelN: UILabel = {
        let labelN = UILabel(frame: .zero)
        labelN.translatesAutoresizingMaskIntoConstraints = false
        labelN.numberOfLines = 0
        labelN.backgroundColor = .systemGreen
        return labelN
        
    }()
    

    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = .systemCyan
    
        self.setUpCellUI()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

    
    private func setUpCellUI(){
        let vstackView = UIStackView(frame: .zero)
        vstackView.translatesAutoresizingMaskIntoConstraints = false
        
//        let stepper1 = UIStepper(frame: .zero)
//        stepper1.translatesAutoresizingMaskIntoConstraints = false
//        stepper1.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25).isActive = true
        vstackView.spacing = 8
        vstackView.axis = .vertical
        vstackView.distribution = .fillEqually
        vstackView.addArrangedSubview(self.LabelName)
        vstackView.addArrangedSubview(self.LabelN)

        
       
        
        
        
        
        let hstackView = UIStackView(frame: .zero)
        hstackView.translatesAutoresizingMaskIntoConstraints = false
        hstackView.spacing = 8
        hstackView.axis = .horizontal
        
        hstackView.addArrangedSubview(self.TImageview)
        hstackView.addArrangedSubview(vstackView)
        
        self.TImageview.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.TImageview.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        self.contentView.addSubview(hstackView)
        hstackView.bindToSuperView()
        
        
    }
}
