//
//  MovieModel.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 09/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation



public struct MovieAPIInfo: Codable{
    let id: Int
    let overview: String
    let releaseDate: String
    let genreIds: [Int]
    let originalTitle: String
    let originalLanguage: String
    let posterPath: String
    let title: String
    let adult: Bool
    let backdropPath: String
    let video: Bool
    let voteAverage: Float
}
