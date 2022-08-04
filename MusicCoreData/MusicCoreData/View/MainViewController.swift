//
//  MainViewController.swift
//  MusicCoreData
//
//  Created by Consultant on 7/22/22.
//

import UIKit
enum ButtonSelectionIdentity {
    case first
    case second
}

class MainViewController: UITabBarController {

    let musicVM: MusicModelType
    var elements: [ButtonSelectionIdentity] = []
    init(vm: MusicModelType){
        self.musicVM = vm
        for _ in 0..<100 {
             elements.append(ButtonSelectionIdentity.first)
         }
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .dark

        let tab1 = UINavigationController(rootViewController:Tab1ViewController(vm: MusicViewModel(networkManager: NetworkManager()), elements: elements, vm1:MusicViewModel(networkManager: NetworkManager())))
        let tab2 = UINavigationController(rootViewController:Tab2ViewController(vm: MusicViewModel(networkManager: NetworkManager()), elements: elements, vm1: MusicViewModel(networkManager: NetworkManager())))
        
        tab1.title = "TOP 100"
        tab2.title = "FAVORITES"
        
        tabBar.unselectedItemTintColor = .white
        self.setViewControllers([tab1,tab2], animated: false)
        self.view.backgroundColor = .systemBackground
     

        self.tabBar.items?[1].setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        self.tabBar.items?[0].setTitleTextAttributes([.foregroundColor: UIColor.lightGray], for: .normal)
    
        self.tabBar.items?[1].image = UIImage(systemName: "star")

        self.tabBar.items?[0].image = UIImage(systemName: "music.quarternote.3")
        
      
    }
 

    


}



class Tab2ViewController: UIViewController {
    
    static let reusedId = "\(Tab2ViewController.self)"
    lazy var PokeImage2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.gifImageWithURL("http://24.media.tumblr.com/4846dcc891b01ce9ec44bca14c999c9a/tumblr_mrfjpuXhbT1rk0s74o1_500.gif")
        return imageView
    }()
    
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.layer.cornerRadius = 10
        table.dataSource = self
        table.delegate = self
//        table.prefetchDataSource = self
        table.register(MusicTableViewCell.self, forCellReuseIdentifier: MusicTableViewCell.reusedId)
        return table
    }()
    let musicVM: MusicViewModel
    var elementss:[ButtonSelectionIdentity]?
    let musicVM1: MusicModelType

    init(vm: MusicViewModel, elements: [ButtonSelectionIdentity], vm1:MusicModelType){
        self.musicVM = vm
        self.musicVM1 = vm1
        self.elementss = elements
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        //self.musicVM.getMusic()
        self.musicVM.bind {
         print("Test: 2")
         DispatchQueue.main.async {
             self.table.reloadData()
         }
        }
        title = "FAVORITES"
        self.setTableView()
    }
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    func setTableView() {
       
        self.view.addSubview(self.PokeImage2)
        self.PokeImage2.bindToSuperView()
      
        self.view.addSubview(self.table)
    
        self.table.bindToSuperView()

    }
}

extension Tab2ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.musicVM.getalbumInfo().count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.reusedId, for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .clear
        cell.accessoryType = .disclosureIndicator
        let m:[Album] = self.musicVM.getalbumInfo()
        guard let model = elementss?[Int(m[indexPath.row].ids)] else { return  UITableViewCell() }
        cell.update(with: model)
        
        //cell.delegate = self
        cell.configure2(musicVM: self.musicVM.getalbumInfo(), index: indexPath.row, musicVM1: self.musicVM1 as! MusicViewModel)
        return cell
    }
}

extension Tab2ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailViewController(vm: MusicViewModel(networkManager: NetworkManager()))
        DispatchQueue.main.async {
            self.table.reloadData()
        }
        if self.musicVM.getalbumInfo().count != 0{
        detailView.configure2(musicVM: self.musicVM, index: indexPath.row, musicVM1: self.musicVM1 as! MusicViewModel)
        
        self.navigationController?.pushViewController(detailView, animated: true)
        }
    }
}
//extension Tab2ViewController: MusicTableViewCellDelegate{
//    func onCellModelChange(cell: MusicTableViewCell, model: ButtonSelectionIdentity) {
//        guard let indexPath = table.indexPath(for: cell) else {
//                   return
//
//               }
//               print(indexPath)
//        let index = indexPath.row
//        self.elementss?[index] = model
//        DispatchQueue.main.async {
//            self.table.reloadData()
//        }
//    }



//}
















class Tab1ViewController: UIViewController {

    static let reusedId = "\(Tab1ViewController.self)"
    
    lazy var Image2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage.gifImageWithURL("https://i.gifer.com/Q3ZD.gif")
        return imageView
    }()
    
    lazy var table: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .clear
        table.layer.cornerRadius = 10
        table.dataSource = self
        table.delegate = self
//        table.prefetchDataSource = self
        table.register(MusicTableViewCell.self, forCellReuseIdentifier: MusicTableViewCell.reusedId)
        return table
    }()
    
    var elementss: [ButtonSelectionIdentity]?
    
    let musicVM: MusicModelType

    let musicVM1: MusicViewModel



    init(vm: MusicModelType, elements:[ButtonSelectionIdentity], vm1: MusicViewModel){
        self.musicVM = vm
        self.musicVM1 = vm1
        self.elementss = elements
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        title = "TOP 100"
        self.musicVM.getMusic()
        self.musicVM.bind {
         print("Test: 2")
         DispatchQueue.main.async {
             self.table.reloadData()
         }
        }
        self.setTableView()
     
        
    }
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    func setTableView() {
        
    self.view.addSubview(self.Image2)
    
    self.Image2.bindToSuperView()

    self.view.addSubview(self.table)
    
    self.table.bindToSuperView()

    }
}

extension Tab1ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.musicVM.countsm
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicTableViewCell.reusedId, for: indexPath) as? MusicTableViewCell else {
            return UITableViewCell()
        }
        cell.backgroundColor = .clear
        cell.accessoryType = .disclosureIndicator
//
//        cell.ButtonPressed()
        guard let model = elementss?[indexPath.row] else { return UITableViewCell() }
        cell.update(with: model)
        cell.delegate = self
        cell.configure(musicVM: self.musicVM, index: indexPath.row, musicVM1: self.musicVM1.getalbumInfo())
        
        return cell
    }
}
extension Tab1ViewController: MusicTableViewCellDelegate{
    func onCellModelChange(cell: MusicTableViewCell, model: ButtonSelectionIdentity) {
        guard let indexPath = table.indexPath(for: cell) else {
                   return
            
               }
               print(indexPath)
        let index = indexPath.row
        self.elementss?[index] = model
        DispatchQueue.main.async {
            self.table.reloadData()
        }
    }
    
    
    
}


extension Tab1ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailViewController(vm: self.musicVM)

        detailView.configure(index: indexPath.row)
        guard let model = elementss?[indexPath.row] else { return }
        detailView.update(with: model)
        self.navigationController?.pushViewController(detailView, animated: true)
    }
}


