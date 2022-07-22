//
//  TableViewCell.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/17/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    static let reusedId = "\(TableViewCell.self)"
    
    
    lazy var Label1: UILabel = {
        let labelI = UILabel(frame: .zero)
        labelI.translatesAutoresizingMaskIntoConstraints = false
        labelI.textAlignment = .center
        labelI.text = "Hello"
        labelI.numberOfLines = 0
        
        labelI.backgroundColor = .white
        return labelI
        
    }()
    
        lazy var slide1: UIProgressView = {
            let slide1 = UIProgressView(frame: .zero)
            slide1.translatesAutoresizingMaskIntoConstraints = false
           // slide1.contentMode = .scaleAspectFit
            slide1.progressViewStyle = .bar
            slide1.progressTintColor = .green
            
            slide1.backgroundColor = .black
            slide1.progress = 0.7
    
    
            return slide1
        }()

    var pokemons3: PokemonDetail?
    func configure3(with pokemon: PokemonDetail, N: Int) {
        self.pokemons3 = pokemon
        self.Label1.text = "\(pokemon.stats[N].stat.name): \(pokemon.stats[N].baseStat)"
        self.slide1.progress = ((pokemon.stats[N].baseStat) * 0.01)/2
            switch pokemon.types[0]?.type.name ?? "" {
            case "grass":
                self.slide1.progressTintColor = .green
            case "poison":
                self.slide1.progressTintColor = .purple

            case "fire":
                self.slide1.progressTintColor = .red
            case "water":
                self.slide1.progressTintColor = .blue
            case "electric":
                self.slide1.progressTintColor = .yellow
            case "ice":
                self.slide1.progressTintColor = .systemIndigo
            case "normal":
                self.slide1.progressTintColor = .gray
            case "flying":
                self.slide1.progressTintColor = .systemCyan
            case "psychic":
                self.slide1.progressTintColor = .systemPink
            case "bug":
                self.slide1.progressTintColor = .systemMint
            case "rock":
                self.slide1.progressTintColor = .systemBrown
            case "fighting":
                self.slide1.progressTintColor = .systemOrange
            case "ghost":
                self.slide1.progressTintColor = .systemFill

            case "dark":
                self.slide1.progressTintColor = .systemGray6
            case "dragon":
                self.slide1.progressTintColor = .systemPurple

            case "steel":
                self.slide1.progressTintColor = .darkGray

            case "fairy":
                self.slide1.progressTintColor = .systemPink

            default:
                break
            
        
    }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
        self.setUpUI()
        self.backgroundColor = .white
        self.layer.cornerRadius = 10
        // Configure the view for the selected state
    }
    
    private func setUpUI(){
        
        let hStack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fill)
        let vStackRight = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        let vStackLeft = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        
        let rightBufferTop = UIView.createBufferView()
        let rightBufferBottom = UIView.createBufferView()
        
        slide1.heightAnchor.constraint(equalToConstant: 15).isActive = true
        slide1.widthAnchor.constraint(equalToConstant:  200).isActive = true
        vStackRight.addArrangedSubview(rightBufferTop)
        vStackRight.addArrangedSubview(self.slide1)
        
    
//        vStackRight.addArrangedSubview(self.PokeType)
//        vStackRight.addArrangedSubview(self.PokeType2)
        vStackRight.addArrangedSubview(rightBufferBottom)
        
        rightBufferTop.heightAnchor.constraint(equalTo: rightBufferBottom.heightAnchor).isActive = true
        
        
        let leftBufferTop = UIView.createBufferView()
        let leftBufferBottom = UIView.createBufferView()
        
        vStackLeft.addArrangedSubview(leftBufferTop)
        vStackLeft.addArrangedSubview(self.Label1)
        vStackLeft.addArrangedSubview(leftBufferBottom)
        
        leftBufferTop.heightAnchor.constraint(equalTo: leftBufferBottom.heightAnchor).isActive = true
        
        hStack.addArrangedSubview(vStackLeft)
        hStack.addArrangedSubview(vStackRight)
        
        self.contentView.addSubview(hStack)
        
        hStack.bindToSuperView()
    }
    
    
}
