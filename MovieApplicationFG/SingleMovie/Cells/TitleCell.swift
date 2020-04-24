//
//  TitleCell.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 15/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit
import SnapKit

class TitleCell: UITableViewCell{
    
    let movieTitleLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(movieTitleLabel)
        contentView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        
        configureMovieTitleLabel()
        
        setupMovieTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Configuration
    func configureMovieTitleLabel(){
        movieTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        movieTitleLabel.numberOfLines = 0
        movieTitleLabel.adjustsFontSizeToFitWidth = true
        movieTitleLabel.font = UIFont.init(name: "Quicksand-Medium", size: 29)
        movieTitleLabel.textColor = .white
    }
    
    func configureCell(title: String){
        selectionStyle = .none
        movieTitleLabel.text = title
    }
    
    
    //MARK: Constraints
    
    func setupMovieTitleLabelConstraints(){
        movieTitleLabel.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().inset(5)
            maker.leading.equalToSuperview().inset(25)
            maker.trailing.equalToSuperview().inset(25)
            maker.bottom.equalToSuperview()
        }

    }
    
}
