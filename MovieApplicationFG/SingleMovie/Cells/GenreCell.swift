//
//  GenreCell.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 15/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit
import SnapKit

class GenreCell: UITableViewCell {
    
    let movieGenreLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(movieGenreLabel)
        contentView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        
        configureMovieGenreLabel()
        
        setupMovieGenreLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureMovieGenreLabel(){
        movieGenreLabel.translatesAutoresizingMaskIntoConstraints = false
        movieGenreLabel.numberOfLines = 0
        movieGenreLabel.adjustsFontSizeToFitWidth = true
        movieGenreLabel.font = UIFont.init(name: "Quicksand-Regular", size: 21)
        movieGenreLabel.textColor = .white
    }
    
    func configureCell(genre: String){
        selectionStyle = .none
        movieGenreLabel.text = genre
    }
    
    func setupMovieGenreLabelConstraints(){
        movieGenreLabel.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().inset(5)
            maker.bottom.equalToSuperview()
            maker.leading.equalToSuperview().inset(25)
            maker.trailing.equalToSuperview().inset(25)
        }
        
    }
    
}
