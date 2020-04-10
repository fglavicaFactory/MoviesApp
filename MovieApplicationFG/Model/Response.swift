//
//  Response.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 09/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation



public struct Response<resultVar: Codable>: Codable {
    let results: resultVar?
}
