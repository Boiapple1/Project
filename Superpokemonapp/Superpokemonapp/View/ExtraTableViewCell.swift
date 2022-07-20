//
//  ExtraTableViewCell.swift
//  Superpokemonapp
//
//  Created by Consultant on 7/18/22.
//

import UIKit

class ExtraTableViewCell: UITableViewCell {
    static let reusedId = "\(ExtraTableViewCell.self)"
    
    lazy var imageD: UIImageView={
        let imageD = UIImageView(frame: .zero)
        imageD.translatesAutoresizingMaskIntoConstraints = false
        imageD.backgroundColor = .clear
        
        imageD.contentMode = .scaleAspectFit
     
       
        return imageD
    }()
    lazy var imageD2: UIImageView={
        let imageD = UIImageView(frame: .zero)
        imageD.translatesAutoresizingMaskIntoConstraints = false
        imageD.backgroundColor = .black
        imageD.contentMode = .scaleAspectFit
     
       
        return imageD
    }()
    lazy var tableV: UITableView = {
        let stack = UITableView(frame: .zero)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.contentMode = .scaleAspectFit
        stack.backgroundColor = .black
        stack.dataSource = self
        stack.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reusedId)
        
        return stack
        
    }()
    lazy var AN: UILabel = {
        let labelN = UILabel(frame: .zero)
        labelN.translatesAutoresizingMaskIntoConstraints = false
        labelN.textAlignment = .center
        labelN.text = "Name"
        labelN.numberOfLines = 0
        labelN.backgroundColor = .white

      
        return labelN
        
    }()
    lazy var AbiNa: UILabel = {
        let labelN = UILabel(frame: .zero)
        labelN.translatesAutoresizingMaskIntoConstraints = false
        labelN.textAlignment = .center
        labelN.text = "Name"
        labelN.numberOfLines = 0
        labelN.backgroundColor = .white

        return labelN
        
    }()
    lazy var Abi1: UILabel = {
        let labelN = UILabel(frame: .zero)
        labelN.translatesAutoresizingMaskIntoConstraints = false
        labelN.textAlignment = .center
        labelN.text = "Abi1"
        labelN.numberOfLines = 0
        labelN.backgroundColor = .white
        labelN.layer.cornerRadius = 10
        return labelN
        
    }()
    lazy var Abi2: UILabel = {
        let labelN = UILabel(frame: .zero)
        labelN.translatesAutoresizingMaskIntoConstraints = false
        labelN.textAlignment = .center
        labelN.text = "Abi2"
        labelN.numberOfLines = 0
        labelN.backgroundColor = .white
        labelN.layer.cornerRadius = 10
        return labelN
        
    }()
    lazy var Num: UILabel = {
        let labelN = UILabel(frame: .zero)
        labelN.translatesAutoresizingMaskIntoConstraints = false
        labelN.textAlignment = .center
        labelN.text = "No.01"
        labelN.numberOfLines = 0
        labelN.backgroundColor = .white
        labelN.layer.cornerRadius = 10
        return labelN
        
    }()
    lazy var mButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Moves Click here", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
      //  button.addTarget(self, action: #selector(self.manualDecodeButtonPressed), for: .touchUpInside)
        //button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.addTarget(self, action: #selector(movesButtonPressed), for: .touchUpInside)
        return button
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(false, animated: animated)
        self.setUpUI()

        // Configure the view for the selected state
    }
    var pokemons: PokemonDetail?
    func configure1(with pokemon: PokemonDetail) {
        
        self.pokemons = pokemon
        
        if (self.pokemons?.types[0]?.type.name == "grass"){
            self.backgroundColor = .green
           // imageD.backgroundColor = .green
            imageD2.image = UIImage.gifImageWithURL("https://i.gifer.com/9TrJ.gif")
        }
        else if(pokemons?.types[0]?.type.name == "poison"){
            self.backgroundColor = .purple
            imageD2.image = UIImage.gifImageWithURL("https://i.pinimg.com/originals/77/cd/50/77cd50e19ca918527863e0ead8d1c07c.gif")
        }
        else if(pokemon.types[0]?.type.name == "fire"){
            self.backgroundColor = .red
            imageD2.image = UIImage.gifImageWithURL("https://media3.giphy.com/media/fX2oud7WOkCyO6jtyv/giphy-downsized-large.gif")
        }
        else if(pokemon.types[0]?.type.name == "water"){
            self.backgroundColor = .blue
            imageD2.image = UIImage.gifImageWithURL("https://www.starpowertv.com/x/cdn/?https://storage.googleapis.com/production-sitebuilder-v1-0-0/760/201760/pbwm1qGA/80683f965c3547658984c21b143b1ca4")
        }
        else if(pokemon.types[0]?.type.name == "electric"){
            self.backgroundColor = .yellow
            imageD2.image = UIImage.gifImageWithURL("https://media4.giphy.com/media/CKlafeh1NAxz35KTq4/200.gif")
            
        }
        else if(pokemon.types[0]?.type.name == "ice"){
            self.backgroundColor = .systemIndigo
            imageD2.image = UIImage.gifImageWithURL("https://www.icegif.com/wp-content/uploads/snow-icegif-29.gif")
            
        }
        else if(pokemon.types[0]?.type.name == "normal"){
            self.backgroundColor = .gray
            imageD2.image = UIImage.gifImageWithURL("https://i.gifer.com/YR9w.gif")
        }
        else if(pokemon.types[0]?.type.name == "flying"){
            self.backgroundColor = .systemCyan
            imageD2.image = UIImage.gifImageWithURL("https://i.pinimg.com/originals/3a/d1/99/3ad1994219dac9084a110deae2447fec.gif")
            
        }
        else if(pokemon.types[0]?.type.name == "psychic"){
            self.backgroundColor = .systemPink
            imageD2.image = UIImage.gifImageWithURL("https://i.pinimg.com/originals/4a/e0/2b/4ae02b3e7b71aa7b38863f25aa3225b1.gif")
           
        }
        else if(pokemon.types[0]?.type.name == "bug"){
            self.backgroundColor = .systemMint
            imageD2.image = UIImage.gifImageWithURL("https://i.gifer.com/6uZa.gif")
        }
        else if(pokemon.types[0]?.type.name == "rock"){
            self.backgroundColor = .systemBrown
            imageD2.image = UIImage.gifImageWithURL("https://media0.giphy.com/media/l46CvhejNs4PFlOQo/giphy.gif")
           
        }
        else if(pokemon.types[0]?.type.name == "fighting"){
            self.backgroundColor = .systemOrange
            imageD2.image = UIImage.gifImageWithURL("https://c.tenor.com/2co4feAipsYAAAAM/hasbulla-hasbik.gif")
            
        }
        else if(pokemon.types[0]?.type.name == "ghost"){
            self.backgroundColor = .black
            imageD2.image = UIImage.gifImageWithURL("https://media0.giphy.com/media/1V17m8MgM0fEk/200.gif")

        }
        else if(pokemon.types[0]?.type.name == "dark"){
            self.backgroundColor = .systemGray6
            imageD2.image = UIImage.gifImageWithURL("https://c.tenor.com/TYLu4v26y8QAAAAM/art-water.gif")
            
        }
        else if(pokemon.types[0]?.type.name == "dragon"){
            self.backgroundColor = .systemPurple
            imageD2.image = UIImage.gifImageWithURL("https://thumbs.gfycat.com/ConstantDefinitiveHoatzin-max-1mb.gif")
            
        }
        else if(pokemon.types[0]?.type.name == "steel"){
            self.backgroundColor = .darkGray
            imageD2.image = UIImage.gifImageWithURL("https://media1.giphy.com/media/d7ncQTkyXi0EnyEMqQ/giphy-downsized-large.gif")
        }
        else if(pokemon.types[0]?.type.name == "fairy"){
            self.backgroundColor = .systemPink
            imageD2.image = UIImage.gifImageWithURL("https://i.pinimg.com/originals/0d/75/8c/0d758c5bf49becbf3c04fcf31a62efe7.gif")
        }
        
        self.AN.text = pokemon.name
        self.Num.text = "No. \(pokemon.id)"
        self.AbiNa.text = "Abilities: "
//        self.Abi1.text = "\(pokemon.abilities[0]?.ability.name ?? "")"
//        self.Abi2.text = "\(pokemon.abilities[1]?.ability.name)"

        let url1s = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/\(pokemon.id).png")
                       
                       
        NetworkManager.shared.fetchImageData(urlStr: url1s) { result in
            DispatchQueue.main.async{ [self] in
                if let data = result{
                    
                    self.imageD.image = UIImage(data: data)
                
                    
                    
                }
            }
        }
        guard let abi1 = pokemon.abilities[0]?.ability.name else{
            return
        }
        self.Abi1.text = "\(abi1)"
        
        if pokemon.abilities.count != 1 {
        self.Abi2.text = "\(pokemon.abilities[1]?.ability.name ?? "")"
        }else{
            self.Abi2.text = "none"
        }
    }
    
    
    private func setUpUI(){
        self.addSubview(self.AbiNa)
        self.addSubview(self.tableV)
        self.addSubview(self.imageD2)
        self.addSubview(self.imageD)
        
        self.addSubview(self.AN)
        self.addSubview(self.Num)
        self.addSubview(self.Abi1)
        self.addSubview(self.Abi2)
        self.addSubview(self.mButton)


        
        Num.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        Num.leadingAnchor.constraint(equalTo: AN.trailingAnchor,constant: 4).isActive = true
        Num.bottomAnchor.constraint(equalTo: mButton.topAnchor,constant: -8).isActive = true
        Num.topAnchor.constraint(equalTo: imageD.bottomAnchor,constant: 8).isActive = true
        Num.topAnchor.constraint(equalTo: imageD2.bottomAnchor,constant: 8).isActive = true
        
        AN.bottomAnchor.constraint(equalTo: mButton.topAnchor,constant: -8).isActive = true
        AN.topAnchor.constraint(equalTo: imageD.bottomAnchor,constant: 8).isActive = true
        AN.topAnchor.constraint(equalTo: imageD2.bottomAnchor,constant: 8).isActive = true
        AN.trailingAnchor.constraint(equalTo: Num.leadingAnchor,constant: -4).isActive = true
        AN.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        AN.widthAnchor.constraint(equalToConstant: 200).isActive = true
        AN.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        mButton.topAnchor.constraint(equalTo: AN.bottomAnchor, constant: 8).isActive = true
        mButton.bottomAnchor.constraint(equalTo: tableV.topAnchor, constant: -8).isActive = true
        mButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        mButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        mButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        Abi2.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        Abi2.leadingAnchor.constraint(equalTo: Abi1.trailingAnchor,constant: 4).isActive = true
        Abi2.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8).isActive = true
        Abi2.topAnchor.constraint(equalTo: AbiNa.bottomAnchor,constant: 8).isActive = true
        
        //AbiNa.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 8).isActive = true
        //AbiNa.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor,constant: -8).isActive = true
        AbiNa.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor).isActive = true
        AbiNa.bottomAnchor.constraint(equalTo: Abi2.topAnchor,constant: -8).isActive = true
        AbiNa.topAnchor.constraint(equalTo: tableV.bottomAnchor,constant: 8).isActive = true
        AbiNa.widthAnchor.constraint(equalToConstant: 150).isActive = true
        AbiNa.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        Abi1.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor,constant: -8).isActive = true
        Abi1.topAnchor.constraint(equalTo: AbiNa.bottomAnchor,constant: 8).isActive = true
        Abi1.trailingAnchor.constraint(equalTo: Abi2.leadingAnchor,constant: -4).isActive = true
        Abi1.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        Abi1.widthAnchor.constraint(equalToConstant: 200).isActive = true
        Abi1.heightAnchor.constraint(equalToConstant: 44).isActive = true

        
        imageD.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        imageD.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        imageD.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -8).isActive = true
        imageD.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        imageD2.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        imageD2.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        imageD2.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor,constant: -8).isActive = true
        imageD2.heightAnchor.constraint(equalToConstant: 220).isActive = true
        
        tableV.layer.cornerRadius = 15
        
        tableV.backgroundColor = .clear
        tableV.heightAnchor.constraint(equalToConstant: 325).isActive = true
        tableV.topAnchor.constraint(equalTo: mButton.bottomAnchor,constant: 8).isActive = true
        tableV.bottomAnchor.constraint(equalTo: AbiNa.topAnchor, constant: -8).isActive = true
        tableV.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        tableV.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
    }
    
    @objc
      func movesButtonPressed() {
   
          self.presentMovesAlert(moves: self.pokemons)
      }
     
    func presentMovesAlert(moves: PokemonDetail?) {
         
         guard let moves = moves else { return }
            
        let movePokemon = moves.moves.compactMap{$0.move.name}.reduce(""){partialResult, movePok in
             return partialResult + movePok + "\n"
         }
        
      let alert = UIAlertController(title: moves.name, message: movePokemon, preferredStyle: .alert)
         let action = UIAlertAction(title: "Moves", style: .default, handler: nil)
         alert.addAction(action)
          DispatchQueue.main.async {
//              self.present(alert, animated: true, completion: nil)
              UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
         }
            
     }


}
extension ExtraTableViewCell: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reusedId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }

        cell.backgroundColor = .black
        guard let poke1 = self.pokemons else {
            return cell
        }
        cell.configure3(with: poke1, N: indexPath.row)
        return cell
    }
    
}
