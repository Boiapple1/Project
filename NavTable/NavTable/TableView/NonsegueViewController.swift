//
//  NonsegueViewController.swift
//  NavTable
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class NonsegueViewController: UIViewController {

//    @IBOutlet weak var TableView1: UITableView!


    @IBOutlet weak var TableView1: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.TableView1.dataSource = self
        
    }
//
    
    var AN: String = ""
    var InF: String = ""
    var Ima: String = ""
    
    
    func configure2(imageStr:String, AName: String, Info: String){
        AN = AName
        InF = Info
        Ima = imageStr
    }
    

}
extension NonsegueViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(AN)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NonsegueTableViewCell", for: indexPath) as? NonsegueTableViewCell else{
            return UITableViewCell()
    }
//        cell.configure1(imageStr: Ima, AName: AN, Info: InF)

            cell.configure1(imageStr: Ima, AName: AN,Info: InF)

            return cell
//        cell.configure1(Ima, AN,InF)
        
        
    
    }
    
}
