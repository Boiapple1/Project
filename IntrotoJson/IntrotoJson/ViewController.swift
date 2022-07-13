//
//  ViewController.swift
//  IntrotoJson
//
//  Created by Consultant on 7/12/22.
//

import UIKit

class ViewController: UIViewController {
    lazy var manualDecodeButton:UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Manually Decode Data", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(self.manualDecodeButtonPressed), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.addSubview(self.manualDecodeButton)
        self.manualDecodeButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.manualDecodeButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        


    }
    @objc
    func manualDecodeButtonPressed(){
        
        
    }

}

