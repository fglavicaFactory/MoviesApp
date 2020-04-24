//
//  DirectorCell.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 15/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit
import SnapKit

class DirectorCell: UITableViewCell {
    
    let movieDirectorLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(movieDirectorLabel)
        contentView.backgroundColor = .init(red: 0.221, green: 0.221, blue: 0.221, alpha: 1)
        
        configureMovieDirectorLabel()
        setupMovieDirectorLabelConstraints()
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureMovieDirectorLabel(){
        movieDirectorLabel.translatesAutoresizingMaskIntoConstraints = false
        movieDirectorLabel.numberOfLines = 0
        movieDirectorLabel.adjustsFontSizeToFitWidth = true
        movieDirectorLabel.font = UIFont.init(name: "Quicksand-Regular", size: 21)
        movieDirectorLabel.textColor = .white
    }
    
    func configureCell(director: String){
        let message = NSMutableAttributedString(string: "Director: ", attributes: [NSAttributedString.Key.font : UIFont(name: "Quicksand-Bold", size: 21)!,
                                                                                   NSAttributedString.Key.foregroundColor : UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)])
        message.append(NSAttributedString(string: director, attributes: [NSAttributedString.Key.font : UIFont(name: "Quicksand-Regular", size: 21)!]))
        movieDirectorLabel.attributedText = message
        }
    
    
    func setupMovieDirectorLabelConstraints(){
        movieDirectorLabel.snp.makeConstraints{(maker) in
            maker.top.equalToSuperview().inset(5)
            maker.bottom.equalToSuperview()
            maker.leading.equalToSuperview().inset(25)
            maker.trailing.equalToSuperview().inset(25)
        }
    }
    
}
