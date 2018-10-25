//
//  giphy.swift
//  CollectionView
//
//  Created by Yoga Pratama on 24/10/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import Foundation

let apiKey = "&api_key=fztKWf4stguXu9hkFujkKRSov4uyyi65&limit=20"

var baseUrl = "http://api.giphy.com/v1/gifs/search?q="

class giphy {
    let processQueue = OperationQueue()
    
    func searchGiphy(_ searchTerm : String) -> Void {
        var searchTearmReplace : String
        
        searchTearmReplace = searchTerm.replacingOccurrences(of: " ", with: "+")
        
       baseUrl += searchTearmReplace
       baseUrl += apiKey
        
        guard let fullUrl = URL(string : baseUrl) else {
            return
        }
        
        URLSession.shared.dataTask(with: fullUrl) { (data , respose, error) in
            if  error != nil{
                print(error!)
            }else{
                 guard let data = data else { return }
                do{
                    let giphyResult = try JSONDecoder().decode(dataStruct.self, from: data)
                    print(giphyResult)
                    
                } catch let errr as NSError {
                    print(errr)
                }
            }
        }
       
        
    }
    
    
    
}
