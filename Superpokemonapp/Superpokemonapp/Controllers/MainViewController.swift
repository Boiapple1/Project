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
        table.backgroundColor = .black
        table.layer.cornerRadius = 10
        table.dataSource = self
        table.delegate = self
        table.prefetchDataSource = self
        table.register(PokemonTableViewCell.self, forCellReuseIdentifier: PokemonTableViewCell.reusedId)
        return table
    }()
    

    var pokemonD = [PokemonDetail]()
    var pokemonurl: Pokemonapi?
    var currentpo = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .black
        self.setTableView()
        self.pokemontable.reloadData()
        self.requestPage()
        title = "Pokemon List"

}
        private func requestPage() {
            let myGroup = DispatchGroup()
            
            var urls: String?
            switch currentpo{
            case 0:
                urls = "https://pokeapi.co/api/v2/pokemon?offset=0&limit=30"
                self.currentpo += 1
            case 1:
                urls = pokemonurl?.next
            case 2:
                urls = pokemonurl?.previous
            default:
                return
            }
            DispatchQueue.main.async {
                self.network.getPokemonList(url1: urls ?? "") { result in

                switch result {
                    case .success(let list):
                    self.pokemonurl = list
                    for pokemonResource in list.results{
                        
                        myGroup.enter()

                            self.network.getPokemon(url:pokemonResource.url) { pokeResult in
                                switch pokeResult {
                                    case .success(let pokemon):
                                    self.pokemonD.append(pokemon)
                                    print(pokemon)
                                    DispatchQueue.main.async {
                                        self.pokemontable.reloadData()
                                    }
                                    myGroup.leave()

                                    case .failure(let error):
                                        print("OOPS! We screwed up.")
                                        print(error)
                                }
                           }
                }
                    myGroup.notify(queue: .main){
                        self.pokemontable.reloadData()
                        

                    }
                    case .failure(let error):
                        print("OOPS! We screwed up.")
                        print(error)
                    
                        self.presentNetworkErrorAlert(error: error)

                }




        }
    }

            
            
//
//
//            self.network.fetchPage(urlStr: "https://api.themoviedb.org/3/movie/popular?api_key=705f7bed4894d3adc718c699a8ca9a4f&language=en-US&page=\(self.currentPage + 1)") { result in
//
//                switch result {
//                case .success(let page):
//                    self.currentPage += 1
//                    self.movies.append(contentsOf: page.results)
//                    DispatchQueue.main.async {
//                        self.movieTable.reloadData()
//                    }
//                case .failure(let error):
//                    print(error)
//
//                    self.presentNetworkErrorAlert(error: error)
//                }
//
//            }
//        }



}


    func setTableView(){
        self.view.backgroundColor = .white
        self.view.addSubview(self.pokemontable)
        self.pokemontable.bindToSuperView()
    }
    
    


}
extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokemonD.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokemonTableViewCell.reusedId, for: indexPath) as? PokemonTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        cell.backgroundColor = .white
        cell.accessoryType = .disclosureIndicator
        cell.configure(with: self.pokemonD[indexPath.row])
        return cell

    

    }

    

}
extension MainViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       

        let detailView = DetailViewController()
        //print(indexPath.row)
        detailView.configure(with: self.pokemonD[indexPath.row])
      
        self.navigationController?.pushViewController(detailView, animated: true)

    }


}

extension MainViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastIndexPath = IndexPath(row: self.pokemonD.count - 5, section: 0)
        guard indexPaths.contains(lastIndexPath) else { return }
        
        self.requestPage()
    }
    
}


extension MainViewController: PokemonCellErrorDelegate {

    func initiateErrorMsg(err: NetworkError) {
        self.presentNetworkErrorAlert(error: err)
    }

}

