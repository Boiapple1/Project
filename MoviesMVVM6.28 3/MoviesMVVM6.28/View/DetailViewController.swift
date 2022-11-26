//
//  DetailViewController.swift
//  MoviesMVVM6.28
//
//  Created by iAskedYou2nd on 8/1/22.
//

import UIKit

class DetailViewController: UIViewController {

    lazy var detailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "SampleDetailScreen"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUp()
    }
    
    private func setUp() {
        self.view.backgroundColor = .white
        self.view.addSubview(self.detailLabel)
        
        self.detailLabel.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        self.detailLabel.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
