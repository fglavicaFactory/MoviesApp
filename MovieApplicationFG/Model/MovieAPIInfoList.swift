//
//  MovieAPIInfoList.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 10/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation

struct MovieAPIListView {
    let id: Int
    let title: String
    let description: String
    let imageURL: String
    let year: String
    //var watched: Bool
    //var favourite: Bool

    
    //Luka, ova init funkcija je da samo povezemo keyworde s json counterpartima? kad sam pitao decke nisu bas imali odgovor
    
    init(id: Int, title: String, imageURL: String, description: String, year: String){
        self.id = id
        self.title = title
        self.description = description
        self.imageURL = imageURL
        self.year = year
      //  self.watched = watched
      //  self.favourite = favourite

}
}
