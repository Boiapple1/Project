//
//  ViewController.swift
//  PokemonApp
//
//  Created by Consultant on 7/17/22.
//

//
//  ViewController.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/14/22.
//

import UIKit

class MainViewController: UIViewController {
    
    static let reusedId = "\(MainViewController.self)"
    
    let network: NetworkManager = NetworkManager()
  
    
    
    lazy var pokemontable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .systemRed
        table.layer.cornerRadius = 10
        //table.dataSource = self
        //table.delegate = self
        //table.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.reusedId)
        //
        return table
        
        
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTableView()
        self.requestPage()
        title = "Pokemon List"

}
    private func requestPage() {

            self.network.getPokemonList(endpoint: .pokemonList(offset: 0, limit: 2)) { result in
                
                switch result {
                    case .success(let list):
                    print(list)
                   
                    for pokemonResource in list.results{
                            self.network.getPokemon(url: "\(pokemonResource.url )") { pokeResult in
                                switch pokeResult {
                                    case .success(let pokemon):
                                       print(pokemon)
                                    DispatchQueue.main.async {
                                       
                                        self.pokemontable.reloadData()
                                    }
                                    case .failure(let error):
                                        print("OOPS! We screwed up.")
                                        print(error)
                                }
                           }
                }
                    case .failure(let error):
                        print("OOPS! We screwed up.")
                        print(error)
                
            }
        }
    }
    
    func setTableView(){
        self.view.backgroundColor = .white
        self.view.addSubview(self.pokemontable)
//        self.pokemontable.bindToSuperView()
    }
    
    


}
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let pokemonId = filteredPokemons[indexPath.row].id
        if editingStyle == .delete {
            filteredPokemons.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            CoreDataManager.shared.deletePokemonInPokedex(withId: Int(pokemonId))
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Pokemons"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredPokemons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let pokemonNameCell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell") as? PokemonCell else {
            return UITableViewCell()
        }
        pokemonNameCell.setupWithPokemon(pokemon: filteredPokemons[indexPath.row])
        return pokemonNameCell
    }
}
//extension MainViewController: UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.reusedId, for: indexPath) as? PokemonTableViewCell else {
//            return UITableViewCell()
//        }
//
//        print(self.pokemon5)
//        // print(self.pokemon4)
//
//
//        //cell.delegate = self
//        cell.backgroundColor = .systemBlue
//        //cell.configure(pokemon:  poked!, network: self.network, pokemona: "")
//        return cell
//
//
//    }
//
//
//
//}
//extension MainViewController:UITableViewDelegate{
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//
//
//        let detailView = DetailViewController()
//        //print(indexPath.row)
//
//        self.navigationController?.pushViewController(detailView, animated: true)
//
//    }
//
//
//}



