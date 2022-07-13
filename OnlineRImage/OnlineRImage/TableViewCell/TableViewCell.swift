//
//  TableViewCell.swift
//  OnlineRImage
//
//  Created by Consultant on 7/11/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let reuseId = "\(TableViewCell.self)"
  
    
    lazy var TImageview: UIImageView={
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .white
        return imageView
    }()
    
    lazy var LabelName: UILabel = {
        let labelNA = UILabel(frame: .zero)
        labelNA.translatesAutoresizingMaskIntoConstraints = false
        labelNA.numberOfLines = 0
        labelNA.textAlignment = .center
        labelNA.backgroundColor = .white
        labelNA.layer.cornerRadius = 15
        return labelNA
        
    }()
    
    lazy var LabelN: UILabel = {
        let labelN = UILabel(frame: .zero)
        labelN.translatesAutoresizingMaskIntoConstraints = false
        labelN.numberOfLines = 0
        labelN.textAlignment = .center
        labelN.backgroundColor = .white
        labelN.layer.cornerRadius = 15
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
    
    var an: Int? = 0
    func indexrow( ar: Int){

        an = ar
        print(an ?? 5)
    }



    
    
    private func setUpCellUI(){
        
        let vstackView = UIStackView(frame: .zero)
        vstackView.translatesAutoresizingMaskIntoConstraints = false
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
    @objc
    func callNetwork(){
        let url = URL(string: "https://picsum.photos/200/300")
        var d = [Int:String]()
        NetworkManager.shared.getData(url: url){ data in
            DispatchQueue.main.async{ [self] in
                if let data = data{
                    
                    self.TImageview.image = UIImage(data: data)
                    
                    self.LabelName.text = "picsum-id= \(Linkandid.inf.id)"
                    self.LabelN.text = "\(Linkandid.inf.link)"
                    d = [Int(an ?? 1):"\(LabelN.text ?? "")"]
                    
                    savedata.share1.saved(dic:d)
                    
                    
                }
                
                    
            }
        }
        
    }
        
}
