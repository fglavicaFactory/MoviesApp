//
//  DescriptionCell.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 15/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit
import SnapKit

class DescriptionCell : UITableViewCell{
    let movieDescriptionLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(movieDescriptionLabel)
        contentView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        
        configureMovieDescriptionLabel()
        setupMovieDescriptionLabelConstraints()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureMovieDescriptionLabel(){
        movieDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDescriptionLabel.numberOfLines = 0
        movieDescriptionLabel.adjustsFontSizeToFitWidth = true
        movieDescriptionLabel.font = UIFont.init(name: "Quicksand-Regular", size: 21)
        movieDescriptionLabel.textColor = .white
    }
    
    func configureCell(description: String){
    selectionStyle = .none
    movieDescriptionLabel.text = description
    }
    
    func setupMovieDescriptionLabelConstraints(){
        movieDescriptionLabel.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().inset(5)
            maker.bottom.equalToSuperview()
            maker.leading.equalToSuperview().inset(25)
            maker.trailing.equalToSuperview().inset(25)
        }
    }
    
}
