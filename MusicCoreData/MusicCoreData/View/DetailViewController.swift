//
//  DetailViewController.swift
//  MusicCoreData
//
//  Created by Consultant on 7/22/22.
//

import UIKit

extension ButtonSelectionIdentity{
    
}

class DetailViewController: UIViewController {

    
    static let reusedId = "\(DetailViewController.self)"
    
    lazy var Mtable: UITableView = {
        let table = UITableView(frame: .zero)

        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .black
        table.layer.cornerRadius = 10
        table.dataSource = self
        table.register(DetailTableViewCell.self, forCellReuseIdentifier: DetailTableViewCell.reusedId)
        return table

    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        self.view.backgroundColor = .black
        title = "Detail"
        self.view.addSubview(self.Mtable)
        self.Mtable.bindToSuperView()
        // Do any additional setup after loading the view.
    }
    var musicVM1: MusicModelType
    init(vm: MusicModelType){
        self.musicVM1 = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var musicM11: MusicModelType?
    var musicVM11: MusicViewModel?
    var ind2: Int?
    
    func configure2(musicVM: MusicViewModel, index: Int, musicVM1: MusicModelType){
        self.musicVM11 = musicVM
        self.musicM11 = musicVM1
        self.ind2 = index
    }
    
    var ind: Int?
   
    func configure(index: Int) {
        self.ind = index

    }
    var mod: ButtonSelectionIdentity?
    func update(with model: ButtonSelectionIdentity) {
        
      mod = model
//        switch model {
//        case .first:
//            mButton.backgroundColor = .white
//            n = true
//
//        case .second:
//            mButton.backgroundColor = .red
//            n = false
//        }
    }
    

}
extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.reusedId, for: indexPath) as? DetailTableViewCell else {
            return UITableViewCell()
        }
//        guard self.musicVM1 != nil else { return UITableViewCell()}
        cell.update(with: mod ?? .first)
        cell.configure1(musicVM: self.musicVM1, index: ind ?? 0)
        if ind2 != nil{
        cell.configure2(musicVM: self.musicVM11?.getalbumInfo() ?? [] , index: ind2 ?? 0, musicVM1: self.musicM11 as! MusicViewModel)
        }
        return cell
    }
}
