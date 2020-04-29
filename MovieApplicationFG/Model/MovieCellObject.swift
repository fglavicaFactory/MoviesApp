//
//  MovieCellObject.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 15/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation

struct MovieCellObject{
    let type: MoviesDataTypeEnum
    let data: Any
}

enum MoviesDataTypeEnum {
    case image
    case title
// case genre
    case director
    case description
}

