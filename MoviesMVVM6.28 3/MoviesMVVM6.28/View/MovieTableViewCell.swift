//
//  MovieTableViewCell.swift
//  MoviesMVVM6.28
//
//  Created by iAskedYou2nd on 7/20/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    static let reuseId = "\(MovieTableViewCell.self)"

    lazy var posterImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "question-mark")
        imageView.layer.cornerRadius = 25.0
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Movie Title"
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        self.contentView.addSubview(self.posterImageView)
        self.contentView.addSubview(self.titleLabel)
        
        self.posterImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        self.posterImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.posterImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        
        self.titleLabel.leadingAnchor.constraint(equalTo: self.posterImageView.trailingAnchor, constant: 8).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        self.posterImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        self.posterImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func configure(movieVM: MovieViewModelType, index: Int) {
        
        self.titleLabel.accessibilityIdentifier = "Section: 0, Index: \(index)"
        self.titleLabel.text = movieVM.movieTitle(for: index)
        movieVM.movieImage(for: index) { imageData in
            guard let imageData = imageData else { return }

            DispatchQueue.main.async {
                self.posterImageView.image = UIImage(data: imageData)
            }
        }
        
        
    }
    
}
