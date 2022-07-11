//
//  ADetailsViewController.swift
//  ProgrammaticUIAPP
//
//  Created by Consultant on 7/9/22.
//

import UIKit

class ADetailsViewController: UIViewController {
    
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
    
    let ANTitle: String
    let ImaN: String
    let Inf: String
    init(ImaN:String, ANTitle: String, Inf: String){
        self.ANTitle = ANTitle
        self.ImaN = ImaN
        self.Inf = Inf
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray4
        self.imageD.image = UIImage(named: "\(ImaN)")
        self.AN.text = "\(ANTitle)"
        self.AInf.text = """
        Information:
        \(Inf)
        """
        self.setUpUI()
        
        

        
        // Do any additional setup after loading the view.
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
    

}
