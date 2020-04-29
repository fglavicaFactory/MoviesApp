//
//  NetworkManager.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 10/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
    
    enum movieError: Error {
        case couldNotParse
        case couldNotProcess
        case generalError
    }
    
    let parameters: Parameters = {
        var parameters = Parameters()
        parameters["api_key"] = "685a0618138480343c0f7e7217246735"
        return parameters
    }()
    
    
    func getData(from url: String, _ completed: @escaping ([MovieAPIInfo]?) -> Void) {
        
        AF.request(url, parameters: parameters).validate().responseDecodable(of: Response<[MovieAPIInfo]?>.self, decoder: SerilizationManager.jsonDecoder) { (movieResponse) in
            do {
                let response = try movieResponse.result.get()
                completed(response.results!)
            } catch let error {
                debugPrint("Error happened: ", error.localizedDescription)
                completed(nil)
            }        }
          
}
        func getMovieDirector(from url: String, movieId: Int, _ completed: @escaping(Director?) -> Void){
            
            AF.request(url, parameters: parameters).validate().responseDecodable(of: Response<[Crew]>.self, decoder: SerilizationManager.jsonDecoder){ (directorResponse) in
                do {
                    let response = try directorResponse.result.get()
                    let index = response.crew!.firstIndex(where: {(crewMember) in crewMember.job == "Director"
                    })
                    completed ((index == nil) ? Director(name: "not found", movieId: movieId): Director(name: response.crew![index!].name, movieId: movieId))
                } catch {
                    debugPrint("Error happened: ", error.localizedDescription)
                    completed(nil)
                }
            }
            
        }
    
    
    func getGenres (url: String, _ completed: @escaping([Genres]?) -> Void){
        AF.request(url, parameters: parameters).validate().responseDecodable(of: Response<[Genres]>.self, decoder: SerilizationManager.jsonDecoder){ (genreResponse) in
            do {
                let response = try genreResponse.result.get()
                completed(response.genres)
            } catch {
                debugPrint("Error happened: ", error.localizedDescription)
                completed(nil)
            }
        }
    }
}

/*
func couldNotParse() {
    print("Could Not Parse")
}
func couldNotProcess() {
    print("Could Not Process")
}
func generalError() {
    print("Error")
}
*/
