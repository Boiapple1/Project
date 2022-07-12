//
//  DetailViewController.swift
//  OnlineRImage
//
//  Created by Consultant on 7/11/22.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var imageD: UIImageView={
        let imageD = UIImageView(frame: .zero)
        imageD.translatesAutoresizingMaskIntoConstraints = false
        imageD.contentMode = .scaleAspectFit
        imageD.backgroundColor = .white
       
        return imageD
    }()
    
    lazy var AN: UILabel = {
        let labelN = UILabel(frame: .zero)
        labelN.translatesAutoresizingMaskIntoConstraints = false
        labelN.textAlignment = .center
        labelN.numberOfLines = 0
        labelN.backgroundColor = .systemBackground
      
        return labelN
        
    }()
    lazy var AInf: UILabel = {
        let labelI = UILabel(frame: .zero)
        labelI.translatesAutoresizingMaskIntoConstraints = false
        labelI.textAlignment = .center
        labelI.numberOfLines = 0
        
        labelI.backgroundColor = .systemBackground
        return labelI
        
    }()
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray4
        self.setUpUI()
        
        

        

    }
    
    
    private func setUpUI(){
        self.view.addSubview(self.imageD)
        imageD.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        imageD.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        imageD.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -8).isActive = true
        imageD.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
        self.view.addSubview(self.AN)
        AN.topAnchor.constraint(equalTo: imageD.bottomAnchor, constant: 8).isActive = true
        AN.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 100).isActive = true
        AN.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -100).isActive = true
        
        self.view.addSubview(self.AInf)
        AInf.topAnchor.constraint(equalTo: AN.bottomAnchor, constant: 8).isActive = true
        AInf.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        AInf.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -8).isActive = true
        
        
    }
    @objc
    func callNetwork1(ANTitle:String){
        let url = URL(string: "\(ANTitle)")
        print(ANTitle)
        
        NetworkManager.shared.getData(url: url){ data in
            DispatchQueue.main.async{ [self] in
                if let data = data{
                    
                    self.imageD.image = UIImage(data: data)
                    
                }
            }
        }
    }

}


