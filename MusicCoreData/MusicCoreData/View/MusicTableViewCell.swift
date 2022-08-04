//
//  MusicTableViewCell.swift
//  MusicCoreData
//
//  Created by Consultant on 7/22/22.
//
protocol MusicTableViewCellDelegate: AnyObject {
    func onCellModelChange(cell: MusicTableViewCell, model: ButtonSelectionIdentity)
    
}
import UIKit

class MusicTableViewCell: UITableViewCell {
    static let reusedId = "\(MusicTableViewCell.self)"
    weak var delegate: MusicTableViewCellDelegate?
    
    lazy var AlbumImage2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
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
        label.text = "hair"
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
        label.text = "home"
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
        // Configure the view for the selected state
    }

        
        
    
    
    private func setup(){

        let hStack = UIStackView(axis: .horizontal, spacing: 8, distribution: .fill)
        let vStackRight = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        let vStackLeft = UIStackView(axis: .vertical, spacing: 8, distribution: .fill)
        
        let rightBufferTop = UIView.createBufferView()
        let rightBufferBottom = UIView.createBufferView()
        
        vStackRight.addArrangedSubview(rightBufferTop)
        vStackRight.addArrangedSubview(self.Name)
        vStackRight.addArrangedSubview(self.Album)
        vStackRight.addArrangedSubview(self.mButton)
        vStackRight.addArrangedSubview(rightBufferBottom)
        
        rightBufferTop.heightAnchor.constraint(equalTo: rightBufferBottom.heightAnchor).isActive = true
        
        let leftBufferTop = UIView.createBufferView()
        let leftBufferBottom = UIView.createBufferView()
        
        vStackLeft.addArrangedSubview(leftBufferTop)
        vStackLeft.addArrangedSubview(self.AlbumImage2)
        vStackLeft.addArrangedSubview(leftBufferBottom)
        
        leftBufferTop.heightAnchor.constraint(equalTo: leftBufferBottom.heightAnchor).isActive = true
        
        hStack.addArrangedSubview(vStackLeft)
        hStack.addArrangedSubview(vStackRight)
        
        self.contentView.addSubview(hStack)
        
        hStack.bindToSuperView()
    }
    
    var musicM: MusicViewModel?
    var ind: Int?
    var ind2: String?
    func configure(musicVM: MusicModelType, index: Int, musicVM1: [Album]) {
        self.ind = index
        self.musicM = musicVM as? MusicViewModel
        self.Name.text = musicVM.MusicArtist(for: index)
        self.ind2 = musicVM.MusicArtist(for: index)
        self.Album.text = musicVM.MusicTitle(for: index)
        self.mButton.backgroundColor = .white
        self.n = true
        for n in 0..<musicVM1.count{
            if musicVM.MusicArtist(for: index) == musicVM1[n].artistname
            {
                
              delegate?.onCellModelChange(cell: self, model: .second)
                self.mButton.backgroundColor = .red
            }
            
        }
        musicVM.musicImage(for: index) { imageData in
            guard let imageData = imageData else { return }

            DispatchQueue.main.async {
                self.AlbumImage2.image = UIImage(data: imageData)
            }
        }
      
    }
    var musicM1: MusicViewModel?
 
    func configure2(musicVM: [Album], index: Int, musicVM1: MusicViewModel) {
        self.n = false
        self.musicM = musicVM1
        self.Name.text = musicVM[index].artistname
        self.ind2 = musicVM[index].artistname
        self.Album.text = musicVM[index].albumname
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

    var n =  false
    var num1: Int?
   
    @objc
    func ButtonPressed() {

        if self.mButton.backgroundColor == .red{
            n = false
        }
        
        if n == true {
        delegate?.onCellModelChange(cell: self, model: .second)
            self.musicM?.makefav(index: ind ?? 0)
            self.musicM?.loadfav()

        }
        
        if n == false {
            delegate?.onCellModelChange(cell: self, model: .first)
            self.mButton.backgroundColor = .white

            self.musicM?.deleteFav(inds: ind2 ?? "")
         
        }
        }
    }
    
    
    

