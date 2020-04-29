//
//  UIImageViewLoadExtension.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 29/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
       
    func loadImage(with imageURL: String){
        if let imageURL = URL(string: "https://image.tmdb.org/t/p/w1280"+imageURL) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let safeImage = UIImage(data: data)
                    DispatchQueue.main.async {[weak self] in
                        self?.image = safeImage
                    }
                }
            }
        }
    }
}
