//
//  DetailTableViewCell.swift
//  MusicCoreData
//
//  Created by Consultant on 7/27/22.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    static let reusedId = "\(DetailTableViewCell.self)"
    
    lazy var PokeImage2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "007")
        return imageView
    }()
    
    lazy var AlbumImage2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        imageView.image = UIImage(named: "01")
        return imageView
    }()
    
    
    lazy var Name: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Name"
        label.backgroundColor = .lightGray
        return label

    }()

    lazy var Album: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Album"
        label.backgroundColor = .lightGray
        return label

    }()
    lazy var genres: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "genres"
        label.backgroundColor = .lightGray
        return label

    }()
    lazy var genresl: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Genres:"
        label.backgroundColor = .lightGray
        return label

    }()
    lazy var date: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "home"
        label.backgroundColor = .lightGray
        return label

    }()
    lazy var Rdate: UILabel = {
        let label = UILabel(frame: .zero)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.layer.cornerRadius = 5
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Release Date:"
        label.backgroundColor = .lightGray
        return label

    }()
    lazy var mButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 15.0
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44).isActive = true
        button.addTarget(self, action: #selector(ButtonPressed), for: .touchUpInside)
        return button
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.setup()
        backgroundColor = .black
        // Configure the view for the selected state
    }
    
    private func setup(){
        self.contentView.addSubview(self.PokeImage2)
        self.PokeImage2.topAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        self.PokeImage2.bottomAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.PokeImage2.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.PokeImage2.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor).isActive = true
        let hStack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fill)
        let vStackRight = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        let vStackLeft = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        
        let rightBufferTop = UIView.createBufferView()
        let rightBufferBottom = UIView.createBufferView()
        
        vStackRight.addArrangedSubview(rightBufferTop)
        vStackRight.addArrangedSubview(self.mButton)
        
        vStackRight.addArrangedSubview(rightBufferBottom)
        
        rightBufferTop.heightAnchor.constraint(equalTo: rightBufferBottom.heightAnchor).isActive = true
        
        let leftBufferTop = UIView.createBufferView()
        let leftBufferBottom = UIView.createBufferView()
        
        vStackLeft.addArrangedSubview(leftBufferTop)
        vStackLeft.addArrangedSubview(self.AlbumImage2)
        vStackLeft.addArrangedSubview(self.Name)
        vStackLeft.addArrangedSubview(self.Album)
        vStackLeft.addArrangedSubview(self.genresl)
        vStackLeft.addArrangedSubview(self.genres)
        vStackLeft.addArrangedSubview(self.Rdate)
        vStackLeft.addArrangedSubview(self.date)
        vStackLeft.addArrangedSubview(leftBufferBottom)
        
        leftBufferTop.heightAnchor.constraint(equalTo: leftBufferBottom.heightAnchor).isActive = true
        
        hStack.addArrangedSubview(vStackLeft)
        hStack.addArrangedSubview(vStackRight)
        
        self.contentView.addSubview(hStack)
        
        hStack.bindToSuperView()
    }
    var musicM: MusicViewModel?
    var ind1: Int?
    func configure1(musicVM: MusicModelType, index: Int) {
        self.ind1 = index
        self.names = musicVM.MusicArtist(for: index) ?? ""
        self.genres.text = musicVM.MusicGenres(for: index)
        self.Name.text = musicVM.MusicArtist(for: index)
        self.Album.text = musicVM.MusicTitle(for: index)
        let datef = DateFormatter()
        datef.dateFormat = "yyyy-MM-dd"
        guard let dat = datef.date(from:  musicVM.MusicReleastD(for: index) ?? "" ) else{return}
//        guard let a = datef.string(for: musicVM.MusicReleastD(for: index)) else {return}
        datef.dateFormat = "MMMM d, y"
        let gooddate = datef.string(from: dat)

        self.date.text = "\(gooddate)"
        musicVM.musicImage(for: index) { imageData in
            guard let imageData = imageData else { return }

            DispatchQueue.main.async {
                self.AlbumImage2.image = UIImage(data: imageData)
            }
        }
    }
    
    
    var musicM1: MusicViewModel?
    var names: String = ""
    var ind: Int?
    func configure2(musicVM: [Album], index: Int, musicVM1: MusicViewModel) {
        self.ind = index
        self.names = musicVM[index].artistname ?? ""
        self.Name.text = musicVM[index].artistname
        self.Album.text = musicVM[index].albumname
        self.genres.text = musicVM[index].genres
        let rea = musicVM[index].releasedate ?? ""
        let datef = DateFormatter()
        datef.dateFormat = "yyyy-MM-dd"
        guard let dat = datef.date(from:  rea ) else{return}
        datef.dateFormat = "MMMM d, y"
        let gooddate = datef.string(from: dat)
        self.date.text = "\(gooddate)"
        self.mButton.backgroundColor = .red
        let a = musicVM[index].picture
        musicVM1.musicImage(for: a ?? "") { imageData in
            guard let imageData = imageData else { return }

            DispatchQueue.main.async {
                self.AlbumImage2.image = UIImage(data: imageData)
            }
        }
      
    }
    
    func update(with model: ButtonSelectionIdentity) {
        switch model {
        case .first:
            mButton.backgroundColor = .white
            n = true
       
        case .second:
            mButton.backgroundColor = .red
            n = false
        }
    }
    

    var n = false
    @objc
    func ButtonPressed() {

        if self.mButton.backgroundColor == .red{
            n = false
        }
        if n == true {
       
            self.musicM?.makefav(index: ind ?? 0)
            self.musicM?.loadfav()
//            self.num1 = (num1 ?? 0) + 1
           

        }
        
        if n == false {
  
            self.mButton.backgroundColor = .white
//            self.musicM?.deleteFav(inds: num1 ?? 0)
//            self.num1 = (num1 ?? 0) - 1
            //self.musicM?.deleteall()
            self.musicM?.deleteFav(inds: names )
            //print(ind2)
        }
}

}
