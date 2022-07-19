//
//  DetailViewController.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/16/22.
//

import UIKit

class DetailViewController: UIViewController {
    lazy var pokemontable: UITableView = {
        let table = UITableView(frame: .zero)

        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .black
        table.layer.cornerRadius = 10
        table.dataSource = self
        table.register(ExtraTableViewCell.self, forCellReuseIdentifier: ExtraTableViewCell.reusedId)
        return table

    }()

    var pokemons = [PokemonDetail]()
    func configure(with pokemon: PokemonDetail) {
        self.pokemons.append(pokemon)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        title = "Pokemon Detail"
        self.view.addSubview(self.pokemontable)
        self.pokemontable.bindToSuperView()
    }
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ExtraTableViewCell.reusedId, for: indexPath) as? ExtraTableViewCell else {
            return UITableViewCell()
        }

        cell.configure1(with: self.pokemons[indexPath.row])
        return cell
    }
}
