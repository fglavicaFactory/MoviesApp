//
//  MovieCellList.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 08/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit
import SnapKit

class MovieCell: UITableViewCell {

    var container = UIView()
    
    var movieImageView = UIImageView()
    
    var movieTitleLabel = UILabel()
    
    var movieGenreLabel = UILabel()
    
    var movieYearLabel = UILabel()
    
    var watchedButton = UIButton()
    
    var favouritedButton = UIButton()
    
    internal var id: Int = 0
    
    let gradientLayer = CAGradientLayer()
    
    weak var delegate: UserInteraction?
    
    
    //MARK: init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .init(red: 0.173, green: 0.173, blue: 0.18, alpha: 1)
        
        contentView.addSubview(container)
        container.addSubview(movieImageView)
        container.addSubview(movieTitleLabel)
        container.addSubview(movieGenreLabel)
        container.addSubview(movieYearLabel)
        container.addSubview(watchedButton)
        container.addSubview(favouritedButton)
        
        
        configureContainer()
        configureImageView()
        configureTitleLabel()
        configureGenreLabel()
        configureYearLabel()
        configureWatchedButton()
        configureFavouriteButton()
        
        setContainerConstraints()
        setImageConstraints()
        setTitleConstraints()
        setGenreConstraints()
        setYearConstraints()
        setWatchedButtonConstraints()
        setFavouritedButtonConstraints()
        
        watchedButton.addTarget(self, action: #selector(watchedButtonPressed), for: .touchUpInside)
        favouritedButton.addTarget(self, action: #selector(favouritedButtonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
    //containterView
    func configureContainer(){
        container.backgroundColor = .init(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        container.layer.cornerRadius = 20
        container.clipsToBounds = true
        container.translatesAutoresizingMaskIntoConstraints = false
        
    }

    // gradient for imageView
    //MARK: Configuration
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
         
        gradientLayer.frame = bounds
    }
    
    func configureImageView() {
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.layer.cornerRadius = 20
        movieImageView.clipsToBounds = true
        func setupGradientLayer() {
            
               gradientLayer.colors = [UIColor.init(red: 0.106, green: 0.106, blue: 0.118, alpha: 0).cgColor, UIColor.init(red: 0.106, green: 0.106, blue: 0.118, alpha: 0.9).cgColor]
            gradientLayer.locations = [0, 0.82]
               
            movieImageView.layer.addSublayer(gradientLayer)
           }
        setupGradientLayer()
    }
    func configureTitleLabel(){
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.font = UIFont(name: "Quicksand-Bold", size: 17)
        movieTitleLabel.textColor = .white
        movieTitleLabel.adjustsFontSizeToFitWidth = true
    }
    func configureGenreLabel(){
        movieGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        movieGenreLabel.numberOfLines = 0
        movieGenreLabel.font = UIFont(name: "Quicksand-Regular", size: 15)
        movieGenreLabel.textColor = .white
    }
    func configureYearLabel(){
        movieYearLabel.translatesAutoresizingMaskIntoConstraints = false
        movieYearLabel.font = UIFont(name: "Quicksand-Medium", size: 21)
        movieYearLabel.textColor = .white
        movieYearLabel.adjustsFontSizeToFitWidth = true
       
    }
    func configureWatchedButton(){
        watchedButton.translatesAutoresizingMaskIntoConstraints = false
        watchedButton.setImage(Images.watchedButton, for: .normal)
        watchedButton.setImage(Images.watchedButtonTapped, for: .selected)
    }
    func configureFavouriteButton(){
        favouritedButton.translatesAutoresizingMaskIntoConstraints = false
        favouritedButton.setImage(Images.favouriteButton, for: .normal)
        favouritedButton.setImage(Images.favouriteButtonTapped, for: .selected)
    }
    
    
    
    
    //MARK: Constraints
    
    func setImageConstraints() {
        movieImageView.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview()
            maker.bottom.equalToSuperview()
            maker.leading.equalToSuperview()
            maker.width.equalTo(155)
            maker.height.equalTo(155)
        }
    }
    func setTitleConstraints(){
        movieTitleLabel.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().inset(15)
            maker.leading.equalTo(movieImageView.snp.trailing).inset(-15)
            maker.trailing.equalToSuperview().inset(12)
        }
    }
    func setGenreConstraints(){
        movieGenreLabel.snp.makeConstraints{(maker) in
            maker.top.equalTo(movieTitleLabel.snp.bottom).inset(-1)
            maker.leading.equalTo(movieImageView.snp.trailing).inset(-20)
            maker.trailing.equalToSuperview().inset(-15)
        }
    }
    func setYearConstraints(){
        movieYearLabel.snp.makeConstraints{(maker) in
            maker.top.equalTo(movieImageView.snp.top).inset(125)
            maker.leading.equalTo(movieImageView.snp.leading).inset(55)
        }
    }
    
    func setWatchedButtonConstraints(){
        watchedButton.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().inset(111)
            maker.leading.equalTo(movieImageView.snp.trailing).inset(-90)
            maker.trailing.equalToSuperview().inset(65)
            maker.height.equalTo(35)
        }
    }
    
    func setFavouritedButtonConstraints(){
        favouritedButton.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().inset(111)
            maker.leading.equalTo(movieImageView.snp.trailing).inset(-140)
            maker.trailing.equalToSuperview().inset(15)
            maker.height.equalTo(35)
        }
    }
    
    func setContainerConstraints(){
        container.snp.makeConstraints {(maker) in
            maker.top.equalToSuperview().inset(8)
            maker.bottom.equalToSuperview().inset(8)
            maker.leading.equalToSuperview().inset(15)
            maker.trailing.equalToSuperview().inset(15)
        }
    }
    
    
    
    //MARK: set function
    
    func set(movie: MovieAPIListView){
        id = movie.id
        movieImageView.loadImage(with: movie.imageURL)
        movieTitleLabel.text = movie.title
        //movieGenreLabel.text = movie.
        movieYearLabel.text = movie.year
        watchedButton.isSelected = movie.watched
        favouritedButton.isSelected = movie.favourite
    }
    
    // temporary clicked logic
    @objc func watchedButtonPressed(){
        delegate?.watchedMoviePressed(with: id)
        }
    
    @objc func favouritedButtonPressed(){
        delegate?.favouritedMoviePressed(with: id)
        }

}





