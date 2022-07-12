//
//  ViewController.swift
//  OnlineRImage
//
//  Created by Consultant on 7/11/22.
//

import UIKit

class MainViewController: UIViewController {

    lazy var Tableview1:UITableView={
        
        let Tableview1 = UITableView(frame: .zero)
        Tableview1.translatesAutoresizingMaskIntoConstraints = false
        Tableview1.backgroundColor = .systemGray
        Tableview1.dataSource = self
        Tableview1.delegate = self
        Tableview1.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        return Tableview1
        
    }()
        
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()
        
        // Do any additional setup after loading the view.
    }

    
    private func setUI(){
        self.view.backgroundColor = .white
        self.title="Random Images"
        self.view.addSubview(self.Tableview1)
        self.Tableview1.bindToSuperView()
        
        

    }
    




}
extension MainViewController:UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
        
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as? TableViewCell else{
            return UITableViewCell()
            
        }
        

            cell.callNetwork()
            cell.indexrow(ar: indexPath.row)
            return cell

            }
    
}
    
    
extension MainViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       

        let detailView = DetailViewController()
        //print(indexPath.row)
        let dic2 = savedata.share1.dic1
        print(dic2)
        detailView.callNetwork1(ANTitle: "")
        self.navigationController?.pushViewController(detailView, animated: true)

    }


}

