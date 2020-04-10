//
//  MovieRequest.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 09/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//



//ostavio sam si za referencu
/*
import Foundation


let url = "https://api.themoviedb.org/3/movie/now_playing?api_key=685a0618138480343c0f7e7217246735&language=en-US&page=1"


class MovieRequest{



    func getData(from url: String){
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard data == data, error == nil else {
            print("Something went wrong")
                return
            }
            
            var result: Response<MyResult>?
            do {
                result = try JSONDecoder().decode(Response.self, from: data!)
            }catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            guard let json = result else {
                return
            }
            
            print(json.results.originalTitle)
            }).resume()
        
        
        }
        
    }


*/
