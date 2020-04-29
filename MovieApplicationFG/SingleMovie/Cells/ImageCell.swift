//
//  ImageCell.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 15/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit
import SnapKit

class ImageCell: UITableViewCell {
    
    let movieImageView = UIImageView()
    
    let watchedButton = UIButton()
    
    let favouritedButton = UIButton()
    
    let gradientLayer = CAGradientLayer()
    
    weak var delegate: UserInteraction?
    
    internal var id: Int = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = movieImageView.bounds
    }
    
    func setupGradientLayer() {
        gradientLayer.colors = [UIColor.init(red: 0.106, green: 0.106, blue: 0.118, alpha: 0).cgColor, UIColor.init(red: 0.106, green: 0.106, blue: 0.118, alpha: 0.9).cgColor]
        gradientLayer.locations = [0, 1]
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(movieImageView)
        contentView.addSubview(watchedButton)
        contentView.addSubview(favouritedButton)
        movieImageView.layer.addSublayer(gradientLayer)
        contentView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        
        configureMovieImageView()
        setupGradientLayer()
        configureWatchedButton()
        configureFavouritedButton()
        
        setupMovieImageViewConstraints()
        setupWatchedButtonConstraints()
        setupFavouritedButtonConstraints()
        
        watchedButton.addTarget(self, action: #selector(watchedButtonPressed), for: .touchUpInside)
        favouritedButton.addTarget(self, action: #selector(favouritedButtonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: configuration
    func configureMovieImageView(){
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.clipsToBounds = true
        movieImageView.layer.cornerRadius = 20
        movieImageView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
    }
    
    func configureWatchedButton(){
        watchedButton.translatesAutoresizingMaskIntoConstraints = false
        watchedButton.setImage(Images.watchedButton, for: .normal)
        watchedButton.setImage(Images.watchedButtonTapped, for: .selected)
        watchedButton.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 35, height: 35))
    }
    
    func configureFavouritedButton(){
        favouritedButton.translatesAutoresizingMaskIntoConstraints = false
        favouritedButton.setImage(Images.favouriteButton, for: .normal)
        favouritedButton.setImage(Images.favouriteButtonTapped, for: .selected)
        favouritedButton.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: 35, height: 35))
    }
    
    func configureCell(image: String, movie: MovieAPIListView){
        id = movie.id
        movieImageView.loadImage(with: image)
        watchedButton.isSelected = movie.watched
        favouritedButton.isSelected = movie.favourite
    }
    //MARK: Constraints
    
    func setupMovieImageViewConstraints(){
        movieImageView.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
            maker.height.equalTo(255)
        }
    }
    
    func setupWatchedButtonConstraints(){
        favouritedButton.snp.makeConstraints { (maker) in
            maker.top.equalToSuperview().inset(35)
            maker.leading.equalToSuperview().inset(325)
            maker.trailing.equalToSuperview().inset(15)
        }
    }
    
    func setupFavouritedButtonConstraints(){
        watchedButton.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().inset(35)
            maker.leading.equalToSuperview().inset(275)
            maker.trailing.equalToSuperview().inset(65)
        }
    }

}


//MARK: button logic (temporary)
    extension ImageCell{
        @objc func watchedButtonPressed(){
            delegate?.watchedMoviePressed(with: id)
        }

        @objc func favouritedButtonPressed(){
            delegate?.favouritedMoviePressed(with: id)
        }
}
