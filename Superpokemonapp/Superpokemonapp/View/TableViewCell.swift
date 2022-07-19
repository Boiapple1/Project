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
        
        labelI.backgroundColor = .systemBackground
        return labelI
        
    }()
    
        lazy var slide1: UIProgressView = {
            let slide1 = UIProgressView(frame: .zero)
            slide1.translatesAutoresizingMaskIntoConstraints = false
           // slide1.contentMode = .scaleAspectFit
            slide1.progressViewStyle = .bar
            slide1.progressTintColor = .green
            
            slide1.backgroundColor = .purple
            slide1.progress = 0.7
    
    
            return slide1
        }()

    var pokemons3: PokemonDetail?
    func configure3(with pokemon: PokemonDetail, N: Int) {
        self.pokemons3 = pokemon
        self.Label1.text = pokemon.stats[N].stat.name
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
        self.setUpUI()
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
