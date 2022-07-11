//
//  MainfrontpageViewController.swift
//  ProgrammaticUIAPP
//
//  Created by Consultant on 7/8/22.
//

import UIKit

class MainfrontpageViewController: UIViewController {
    lazy var Tableview1:UITableView={
        
        let Tableview1 = UITableView(frame: .zero)
        Tableview1.translatesAutoresizingMaskIntoConstraints = false
        Tableview1.backgroundColor = .systemGray
        Tableview1.dataSource = self
        Tableview1.delegate = self
        Tableview1.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseId)
        Tableview1.register(ButtonTableViewCell.self, forCellReuseIdentifier: ButtonTableViewCell.reuseId1)
        return Tableview1
        
    }()
        
    
    

    
    var An1: String?
    var Inf1: String?
    var Img1: String?
    var n=0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        // Do any additional setup after loading the view.
    }
    
    private func setUI(){
        self.view.backgroundColor = .white
        self.title="Animals"
        self.view.addSubview(self.Tableview1)
        self.Tableview1.bindToSuperView()
        
        

    }



}
extension MainfrontpageViewController:UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseId, for: indexPath) as? MainTableViewCell else{
            return UITableViewCell()
            
        }
        guard let cell1 = tableView.dequeueReusableCell(withIdentifier: ButtonTableViewCell.reuseId1, for: indexPath) as? ButtonTableViewCell else {
            return UITableViewCell()
        }
 

        
//            cell.configure(imageStr: "Bear", Name: "Bear")
        switch indexPath.row {
        case n:
            An1 = AnimalDescription.Panda.name
        case n+2:
            An1 = AnimalDescription.bear.name
    
        case n+4:
            An1 = AnimalDescription.Elephants.name
        
        case n+6:
            An1 = AnimalDescription.Giraffe.name
         
        case n+8:
            An1 = AnimalDescription.Duck.name
           
        case n+10:
            An1 = AnimalDescription.Deer.name
            
        default:
            An1 = AnimalDescription.bear.name
            
            
        }
     
                cell.TImageview.image = UIImage(named: "i \(indexPath.row)")
                cell.LabelName.text = "\(An1 ?? "")"
                cell.LabelN.text = "Number= \(indexPath.row)"

        if indexPath.row % 2 == 0{
            return cell
        }else{
            return cell1
        }
              
 

            }
    
}
    
    
extension MainfrontpageViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case n:
            An1 = AnimalDescription.Panda.name
            Inf1 = AnimalDescription.Panda.info
        case n+2:
            An1 = AnimalDescription.bear.name
            Inf1 = AnimalDescription.bear.info
    
            
        case n+4:
            An1 = AnimalDescription.Elephants.name
            Inf1 = AnimalDescription.Elephants.info
        
        case n+6:
            An1 = AnimalDescription.Giraffe.name
            Inf1 = AnimalDescription.Giraffe.info
         
        case n+8:
            An1 = AnimalDescription.Duck.name
            Inf1 = AnimalDescription.Duck.info
           
        case n+10:
            An1 = AnimalDescription.Deer.name
            Inf1 = AnimalDescription.Deer.info
            
        default:
            An1 = AnimalDescription.bear.name
            Inf1 = AnimalDescription.bear.info
            
            
        }
        if indexPath.row % 2 == 0{
        let detailView = ADetailsViewController(ImaN: "i \(indexPath.row)", ANTitle: "\(An1 ?? "")", Inf: "\(Inf1 ?? "")")
        self.navigationController?.pushViewController(detailView, animated: true)
        }
    }
}
