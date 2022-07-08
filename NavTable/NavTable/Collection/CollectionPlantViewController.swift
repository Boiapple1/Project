//
//  CollectionPlantViewController.swift
//  NavTable
//
//  Created by Consultant on 7/7/22.
//

import UIKit

class CollectionPlantViewController: UIViewController {

    @IBOutlet weak var CollectionPlant: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.CollectionPlant.dataSource = self
        self.CollectionPlant.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        // Do any additional setup after loading the view.
    }
    


}
extension CollectionPlantViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var n=0
        while n < indexPath.row{
            
            if indexPath.row == n{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else{
            return UICollectionViewCell()}
                
        cell.configplant(imageStr: "rose", Pname: "Rose")
        return cell
            }else if indexPath.row == n+1{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else{
                    return UICollectionViewCell()}
                cell.configplant(imageStr: "daisies", Pname: "Daisies")
                return cell
            }else if indexPath.row == n+2{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else{
                    return UICollectionViewCell()}
                cell.configplant(imageStr: "Orchid", Pname: "Orchid")
                return cell
            }else if indexPath.row == n+3{
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else{
                    return UICollectionViewCell()}
                cell.configplant(imageStr: "lotus", Pname: "lotus")
                return cell
          
            }
            n = n+4
        }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else{
            return UICollectionViewCell()}
        cell.configplant(imageStr: "Passion", Pname: "Passion")
        return cell
    
    
    
        }
    
}
