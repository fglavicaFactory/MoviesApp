//
//  SerilizationManager.swift
//  MovieApplicationFG
//
//  Created by Filip Glavica on 10/04/2020.
//  Copyright © 2020 Filip Glavica. All rights reserved.
//

import Foundation

public class SerilizationManager {
    static let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        
        
        //(defferedToData - The strategy that encodes data using the encoding specified by the data instance itself.
        decoder.dataDecodingStrategy = .deferredToData
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder

    }()

    public static func parseData<resultVar: Codable>(jsonData: Data) ->resultVar?{
        let object: resultVar?
        
        do {
            // try jer postoji mogucnost neuspjeha, zato imamo i custom error
            object = try jsonDecoder.decode(resultVar.self, from: jsonData)
            
            
            
        }catch let error {
            debugPrint("Error while parsing. Recieved dataClassType: \(resultVar.self). More info: \(error)")
            object = nil
        }
        return object
        
        
        
    }




}
