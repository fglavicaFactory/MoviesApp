//
//  NetworkManager.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 10/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation

class NetworkManager {
    let APIkey = "?api_key=685a0618138480343c0f7e7217246735"
    
    enum movieError: Error {
        case couldNotParse
        case couldNotProcess
        case generalError
    }
    
    
    func getData(from url: String, _ completed: @escaping ([MovieAPIInfo]?) -> Void) {
        
        guard let safeUrl = URL(string: url + APIkey) else {return}
        
        URLSession.shared.dataTask(with: safeUrl) {data, URLResponse, error in
            
            guard let safeData = data, error == nil, URLResponse != nil
                else {
                    movieError.generalError
                    completed(nil)
                    return
            }
            
            do{
                if let decodedObject: Response<[MovieAPIInfo]> = SerilizationManager.parseData(jsonData: safeData){
                    DispatchQueue.main.async {
                        completed(decodedObject.results)
                    }
                }else {
                        movieError.couldNotParse
                        completed(nil)
                    }
                }catch let error{
                    movieError.couldNotProcess
                    completed(nil)
                }
            }.resume()
          
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
