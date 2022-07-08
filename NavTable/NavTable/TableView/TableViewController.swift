//
//  TableViewController.swift
//  NavTable
//
//  Created by Consultant on 7/6/22.
//

import UIKit

class TableViewController: UIViewController {
    @IBOutlet weak var TableView: UITableView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.TableView.backgroundColor = .systemBlue
        
        
        self.TableView.dataSource = self
        self.TableView.delegate = self
        
    }
    var An1: String?
    var Inf1: String?
    var Img1: String?
    var n=0

    
}
extension TableViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case n:
            An1 = AnimalDescription.bear.name
            Img1 = AnimalDescription.bear.imageName
            Inf1 = AnimalDescription.bear.info
        case n+1:
            An1 = AnimalDescription.Giraffe.name
            Img1 = AnimalDescription.Giraffe.imageName
            Inf1 = AnimalDescription.Giraffe.info
    
            
        case n+2:
            An1 = AnimalDescription.Elephants.name
            Img1 = AnimalDescription.Elephants.imageName
            Inf1 = AnimalDescription.Elephants.info
        
        case n+3:
            An1 = AnimalDescription.Duck.name
            Img1 = AnimalDescription.Duck.imageName
            Inf1 = AnimalDescription.Duck.info
         
        case n+4:
            An1 = AnimalDescription.Panda.name
            Img1 = AnimalDescription.Panda.imageName
            Inf1 = AnimalDescription.Panda.info
           
            
            
        default:
            An1 = AnimalDescription.bear.name
            Img1 = AnimalDescription.bear.imageName
            Inf1 = AnimalDescription.bear.info
            
            
        }

        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier:"NonseguelViewController" ) as? NonsegueViewController else {return}
        
        
        
        vc.configure2(imageStr: Img1 ?? "", AName: An1 ?? "", Info: Inf1 ?? "")
        

        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}


extension TableViewController:UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }
    
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
  
    return 5
    
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
//    self.tableView(tableView, numberOfRowsInSection: 10)
 
    while n<indexPath.row{
    
    if indexPath.row == n{
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else{
        return UITableViewCell()
        
    }
        cell.configure(imageStr: "Bear", Name: "Bear")
       

        return cell
        
    }
    else if indexPath.row == n+1{
        guard let cell2 = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2", for: indexPath) as? TableViewCell2 else{
            return UITableViewCell()
        }
        cell2.configure(imageStr: "gif", name: "Giraffe")

            return cell2
        
    }
    else if indexPath.row == n+2{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell3", for: indexPath) as? TableViewCell3 else{
            return UITableViewCell()
        }
        cell.configure(imageStr: "ele", name: "Elephant")

            return cell
    }
    else if indexPath.row == n+3{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell4", for: indexPath) as? TableViewCell4 else{
            return UITableViewCell()
        }
        cell.configure(imageStr: "ducks", name: "Ducks")

        
            return cell
    }
    else if indexPath.row == n+4{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell5", for: indexPath) as? TableViewCell5 else{
            return UITableViewCell()
        }
        cell.configure(imageStr: "panda", name: "Panda")

            return cell
    }

        n = n+5
    }
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else{
            return UITableViewCell()
        }
    cell.configure(imageStr: "Bear", Name: "Bear")


            return cell
        
}

}
