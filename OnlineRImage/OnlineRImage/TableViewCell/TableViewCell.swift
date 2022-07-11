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
        self.callNetwork()
        self.setUpCellUI()
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    static var a:String?
    
    @objc
    func callNetwork(){
        let url = URL(string: "https://picsum.photos/200/300")
        
        NetworkManager.shared.getData(url: url){ data, response in
            DispatchQueue.main.async {
                let httpResponse = response as? HTTPURLResponse
                let an = httpResponse?.value(forHTTPHeaderField: "picsum-id")
                let urlcell = response.url
                TableViewCell.a = urlcell?.absoluteString ?? ""
                if let data = data{
                    self.TImageview.image = UIImage(data: data)
                    self.LabelName.text = "picsum-id= \(an ?? "")"
                    self.LabelN.text = "\(urlcell?.absoluteString ?? "unknown"))"
                    
                }
                    
            }
        }
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

}
