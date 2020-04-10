//
//  StaticData.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 08/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import UIKit

struct Images {
    static let watchedButton = UIImage(named: "watchedButton")!
    static let watchedButtonTapped = UIImage(named: "watchedButtonTapped")!
    static let favouriteButton = UIImage(named: "favouriteButton")!
    static let favouriteButtonTapped = UIImage(named: "favouriteButtonTapped")!
    static let jumanji = UIImage(named: "jumanjiImage")!
    static let littleWomen = UIImage(named: "littleWomenImage")!
    static let insideOut = UIImage(named: "insideOutImage")!
    static let fantastic = UIImage(named: "fantasticImage")!
    static let backButton = UIImage(named: "backButton")!
}


extension MovieListVC{
    
    func fetchData() -> [Movie]{
     
        let movie1 = Movie(image: Images.littleWomen, title: "Little Women", genre: "Drama, romance", year: "2019", director: "Greta Gerwig", description: "Jo March reflects back and forth on her life, telling the beloved story of the March sisters - four young women each determined to live life on her own terms.")
        let movie2 = Movie(image: Images.fantastic, title: "Fantastic Beasts: The Crimes of Grindelwald", genre: "Adventure, fantasy, family", year: "2018", director: "David Yates", description: "The adventures of writer Newt Scamander in New York's secret community of witches and wizards seventy years before Harry Potter reads his book in school.")
        let movie3 = Movie(image: Images.insideOut, title: "Inside Out", genre: "Animation, comedy, adventure", year: "2015", director: " Pete Docter", description: "After young Riley is uprooted from her Midwest life and moved to San Francisco, her emotions - Joy, Fear, Anger, Disgust and Sadness - conflict on how best to navigate a new city, house, and school.")
        let movie4 = Movie(image: Images.jumanji, title: "Jumanji", genre: "Adventure, action", year: "2017", director: "Jake Kasdan", description: "In Jumanji: The Next Level, the gang is back but the game has changed. As they return to rescue one of their own, the players will have to brave parts unknown from arid deserts to snowy mountains, to escape the world's most dangerous game.")
        
        return [movie1, movie2, movie3, movie4]
    }
}
