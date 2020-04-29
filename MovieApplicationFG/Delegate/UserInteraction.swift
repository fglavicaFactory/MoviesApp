//
//  UserInteraction.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 27/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation

protocol UserInteraction: class {
    func watchedMoviePressed(with id: Int)
    func favouritedMoviePressed(with id: Int)
}
