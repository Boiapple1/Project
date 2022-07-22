//
//  FirstPageViewController.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/17/22.
//

import UIKit
import AVFoundation
import AVKit

class FirstPageViewController: UIViewController {
    
    lazy var PokeImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
        imageView.image = UIImage.gifImageWithURL("https://media0.giphy.com/media/Gm7LdndVpiCs0/giphy.gif?cid=ecf05e47hzmww5ruco4bzwijk8ciwk7959tr0fqg9ip38azw&rid=giphy.gif&ct=g")
        return imageView
    }()


    lazy var mButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("START", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15.0
        //self.transitioningDelegate = self
      //  button.addTarget(self, action: #selector(self.manualDecodeButtonPressed), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.addTarget(self, action: #selector(ButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        let pokegif = UIImage.gifImageWithName("giphy")
//        PokeImage.image = pokegif
        self.view.addSubview(self.PokeImage)
        self.PokeImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.PokeImage.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.PokeImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.PokeImage.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        //self.navigationController?.hidesBarsOnTap = true
        self.view.addSubview(self.mButton)
        self.mButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.mButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        self.mButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 100).isActive = true
        self.mButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -100).isActive = true
        // Do any additional setup after loading the view.
    }
    @objc
    func ButtonPressed() {
        
        let detailView = MainViewController()
        //detailView.requestP()
        self.navigationController?.pushViewController(detailView, animated: true)
        
        
    }
    



}

