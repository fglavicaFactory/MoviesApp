//
//  MovieCellList.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 08/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

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
        
        watchedButton.addTarget(self, action: #selector(watchedButtonTapped), for: .touchUpInside)
        favouritedButton.addTarget(self, action: #selector(favouritedButtonTapped), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //variables
    
    var container = UIView()
    var movieImageView = UIImageView()
    var movieTitleLabel = UILabel()
    var movieGenreLabel = UILabel()
    var movieYearLabel = UILabel()
    var watchedButton = UIButton()
    var favouritedButton = UIButton()
    
    
    //containterView
    func configureContainer(){
        container.backgroundColor = .init(red: 0.11, green: 0.11, blue: 0.118, alpha: 1)
        container.layer.cornerRadius = 20
        container.clipsToBounds = true
    }
    
    
    
    // gradient for imageView
    //MARK: Configuration
    let gradientLayer = CAGradientLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
         
        gradientLayer.frame = bounds
    }
    
    func configureImageView() {
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
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.font = UIFont(name: "Quicksand-Bold", size: 17)
        movieTitleLabel.textColor = .white
    }
    func configureGenreLabel(){
        movieGenreLabel.numberOfLines = 0
        movieGenreLabel.font = UIFont(name: "Quicksand-Regular", size: 15)
        movieGenreLabel.textColor = .white
    }
    func configureYearLabel(){
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
        movieImageView.translatesAutoresizingMaskIntoConstraints = false
        movieImageView.topAnchor.constraint(equalTo: container.topAnchor, constant: 0 ).isActive = true
        movieImageView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: 0).isActive = true
        movieImageView.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 0).isActive = true
        movieImageView.widthAnchor.constraint(equalToConstant: 155).isActive = true
    }
    func setTitleConstraints(){
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.topAnchor.constraint(equalTo: container.topAnchor, constant: 15).isActive = true
        movieTitleLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant:20).isActive = true
        movieTitleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15).isActive = true
    }
    func setGenreConstraints(){
        movieGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        movieGenreLabel.topAnchor.constraint(equalTo: movieTitleLabel.bottomAnchor, constant: 0).isActive = true
        movieGenreLabel.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant:20).isActive = true
        movieGenreLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -15).isActive = true
    }
    func setYearConstraints(){
        movieYearLabel.translatesAutoresizingMaskIntoConstraints = false
        movieYearLabel.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor, constant: -4).isActive = true
        movieYearLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor, constant:55).isActive = true
        movieYearLabel.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: -56).isActive = true
    }
    
    func setWatchedButtonConstraints(){
        watchedButton.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 90).isActive = true
        watchedButton.topAnchor.constraint(equalTo: topAnchor, constant: 111).isActive = true
        watchedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -65).isActive = true
    }
    
    func setFavouritedButtonConstraints(){
        favouritedButton.leadingAnchor.constraint(equalTo: movieImageView.trailingAnchor, constant: 140).isActive = true
        favouritedButton.topAnchor.constraint(equalTo: topAnchor, constant: 111).isActive = true
        favouritedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    }
    
    func setContainerConstraints(){
        container.translatesAutoresizingMaskIntoConstraints = false
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        container.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //MARK: set function
    
    func set(movie: MovieAPIListView){
        movieImageView.loadImage(with: movie.imageURL)
        movieTitleLabel.text = movie.title
        //movieGenreLabel.text = movie.
        movieYearLabel.text = movie.year
    }
    
    // temporary clicked logic
    @objc func watchedButtonTapped (){
          if watchedButton.isSelected == true {
            watchedButton.isSelected = false
          }else {
            watchedButton.isSelected = true
          }
        }
    
    @objc func favouritedButtonTapped(){
          if favouritedButton.isSelected == true {
            favouritedButton.isSelected = false
          }else {
            favouritedButton.isSelected = true
          }
        }
    
    
   
    
    
}
    extension UIImageView{
       
            func loadImage(with imageURL: String){
                if let imageURL = URL(string: "https://image.tmdb.org/t/p/w1280"+imageURL) {
                    DispatchQueue.global().async {
                        let data = try? Data(contentsOf: imageURL)
                        if let data = data {
                            let safeImage = UIImage(data: data)
                            DispatchQueue.main.async {[weak self] in
                                self?.image = safeImage
                            }
                        }
                    }
                }
        }
    }
