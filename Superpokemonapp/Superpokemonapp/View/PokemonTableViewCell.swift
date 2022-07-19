//
//  PokemonTableViewCell.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/15/22.
//

import UIKit
protocol PokemonCellErrorDelegate: AnyObject {
    func initiateErrorMsg(err: NetworkError)
}

class PokemonTableViewCell: UITableViewCell {
    
    
    
    
    static let reusedId = "\(PokemonTableViewCell.self)"
    let network: NetworkManager = NetworkManager()
    lazy var PokeImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemPurple
        imageView.image = UIImage(named: "Sample")
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return imageView
    }()

    lazy var pokename: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.cornerRadius = 5.0
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.text = "Pokemon Name"
        label.backgroundColor = .systemRed
        
        return label
    }()

    lazy var PokeType: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Type"
        label.backgroundColor = .systemOrange
        return label

    }()
    lazy var PokeNum: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Type"
        label.backgroundColor = .white
        return label

    }()

    lazy var PokeType2: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Type2"
        label.backgroundColor = .systemOrange
        return label

    }()
    var delegate: PokemonCellErrorDelegate?
    var pokemons: PokemonDetail?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.setUpUI()
        // Configure the view for the selected state
    }

//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
    
    private func setUpUI() {
        let hStack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fill)
        let vStackRight = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        let vStackLeft = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        
        let rightBufferTop = UIView.createBufferView()
        let rightBufferBottom = UIView.createBufferView()
        
        vStackRight.addArrangedSubview(rightBufferTop)
        vStackRight.addArrangedSubview(self.PokeNum)
        vStackRight.addArrangedSubview(self.pokename)
        vStackRight.addArrangedSubview(self.PokeType)
        vStackRight.addArrangedSubview(self.PokeType2)
        vStackRight.addArrangedSubview(rightBufferBottom)
        
        rightBufferTop.heightAnchor.constraint(equalTo: rightBufferBottom.heightAnchor).isActive = true
        
        let leftBufferTop = UIView.createBufferView()
        let leftBufferBottom = UIView.createBufferView()
        
        vStackLeft.addArrangedSubview(leftBufferTop)
        vStackLeft.addArrangedSubview(self.PokeImage)
        vStackLeft.addArrangedSubview(leftBufferBottom)
        
        leftBufferTop.heightAnchor.constraint(equalTo: leftBufferBottom.heightAnchor).isActive = true
        
        hStack.addArrangedSubview(vStackLeft)
        hStack.addArrangedSubview(vStackRight)
        
        self.contentView.addSubview(hStack)
        
        hStack.bindToSuperView()
    }
    
    func configure(with pokemon: PokemonDetail) {
        self.pokemons = pokemon
        self.pokename.text = pokemon.name
        self.PokeNum.text = "\(pokemon.id)"
        
        network.fetchImageData1(urlStr: pokemon.sprites.frontDefault) { result in
            switch result {
            case .success(let imageData):
                DispatchQueue.main.async {
                    print("Image pulled from network")
                    ImageCache.shared.setImageData(data: imageData, key: "\(pokemon.id)")
                    
                    if pokemon.id == (self.pokemons?.id ?? -1) {
                        self.PokeImage.image = UIImage(data: imageData)
                    }
                }
            case .failure(let error):
                print(error)
                self.delegate?.initiateErrorMsg(err: error)
            }
        }
        
        guard let mainType = pokemon.types.first??.type.name else {
            return
        }
      
        self.PokeType.text = "\(mainType) "
                
        switch mainType {
        case "grass":
            self.PokeType.backgroundColor = .green
            self.PokeImage.backgroundColor = .green
        case "poison":
            self.PokeType.backgroundColor = .purple
            self.PokeImage.backgroundColor = .purple
        case "fire":
            self.PokeType.backgroundColor = .red
            self.PokeImage.backgroundColor = .red
        case "water":
            self.PokeType.backgroundColor = .blue
            self.PokeImage.backgroundColor = .blue
        case "electric":
            self.PokeType.backgroundColor = .yellow
            self.PokeImage.backgroundColor = .yellow
        case "ice":
            self.PokeType.backgroundColor = .systemIndigo
            self.PokeImage.backgroundColor = .systemIndigo
        case "normal":
            self.PokeType.backgroundColor = .gray
            self.PokeImage.backgroundColor = .gray
        case "flying":
            self.PokeType.backgroundColor = .systemCyan
            self.PokeImage.backgroundColor = .systemCyan
        case "psychic":
            self.PokeType.backgroundColor = .systemPink
            self.PokeImage.backgroundColor = .systemPink
        case "bug":
            self.PokeType.backgroundColor = .systemMint
            self.PokeImage.backgroundColor = .systemMint
        case "rock":
            self.PokeType.backgroundColor = .systemBrown
            self.PokeImage.backgroundColor = .systemBrown
        case "fighting":
            self.PokeType.backgroundColor = .systemOrange
            self.PokeImage.backgroundColor = .systemOrange
        case "ghost":
            self.PokeType.backgroundColor = .systemFill
            self.PokeImage.backgroundColor = .systemFill
        case "dark":
            self.PokeType.backgroundColor = .systemGray6
            self.PokeImage.backgroundColor = .systemGray6
        case "dragon":
            self.PokeType.backgroundColor = .systemPurple
            self.PokeImage.backgroundColor = .systemPurple
        case "steel":
            self.PokeType.backgroundColor = .darkGray
            self.PokeImage.backgroundColor = .darkGray
        case "fairy":
            self.PokeType.backgroundColor = .systemPink
            self.PokeImage.backgroundColor = .systemPink
        default:
            break
        }
        
        
        guard let maintype2 = pokemon.types.last??.type.name else {
            self.PokeType2.text = ""
            self.PokeType2.backgroundColor = .white
            return
            
        }
      
        
        self.PokeType2.text = "\(maintype2)"
        
        switch maintype2 {
        case "grass":
            self.PokeType2.backgroundColor = .green
        case "poison":
            self.PokeType2.backgroundColor = .purple

        case "fire":
            self.PokeType2.backgroundColor = .red
        case "water":
            self.PokeType2.backgroundColor = .blue
        case "electric":
            self.PokeType2.backgroundColor = .yellow
        case "ice":
            self.PokeType2.backgroundColor = .systemIndigo
        case "normal":
            self.PokeType2.backgroundColor = .gray
        case "flying":
            self.PokeType2.backgroundColor = .systemCyan
        case "psychic":
            self.PokeType2.backgroundColor = .systemPink
        case "bug":
            self.PokeType2.backgroundColor = .systemMint
        case "rock":
            self.PokeType2.backgroundColor = .systemBrown
        case "fighting":
            self.PokeType2.backgroundColor = .systemOrange
        case "ghost":
            self.PokeType2.backgroundColor = .systemFill

        case "dark":
            self.PokeType2.backgroundColor = .systemGray6
        case "dragon":
            self.PokeType2.backgroundColor = .systemPurple

        case "steel":
            self.PokeType2.backgroundColor = .darkGray

        case "fairy":
            self.PokeType2.backgroundColor = .systemPink

        default:
            break
        }// self.PokeType2.text = "\(pokemon.types[1].type.name)"
        
        
        
        
        if let imageData = ImageCache.shared.getImageData(key: "\(pokemon.id)") {
            print("Image found in cache")
            self.PokeImage.image = UIImage(data: imageData)
            return
        }
     //   let url1s = URL(string: pokemon.sprites.frontDefault)
                       
//        network.fetchImageData1(urlStr: pokemon.sprites.frontDefault) { result in
//            switch result {
//            case .success(let imageData):
//                DispatchQueue.main.async {
//                    print("Image pulled from network")
//                    ImageCache.shared.setImageData(data: imageData, key: "\(pokemon.id)")
//
//                    if pokemon.id == (self.pokemons?.id ?? -1) {
//                        self.PokeImage.image = UIImage(data: imageData)
//                    }
//                }
//            case .failure(let error):
//                print(error)
//                self.delegate?.initiateErrorMsg(err: error)
//            }
//        }
    }
    
    override func prepareForReuse() {
        self.pokename.text = "Pokemon Name"
        self.PokeNum.text = "1"
        self.PokeType2.text = ""
        self.PokeType.text = ""
        self.PokeImage.image = UIImage(named: "1")
        self.pokemons = nil
    }
}
