//
//  giphy.swift
//  CollectionView
//
//  Created by Yoga Pratama on 24/10/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import Foundation
import UIKit

let apiKey = "&api_key=fztKWf4stguXu9hkFujkKRSov4uyyi65&limit=20"

var baseUrl = "http://api.giphy.com/v1/gifs/search?q="

class giphy {
    
    let processQueue = OperationQueue()
   
    func searchGiphy(_ searchTerm : String , completion : @escaping (_ results :  giphySearchResult?,_ error : NSError?) -> Void) {
        var searchTearmReplace : String
        var concenateURL : String
        
        searchTearmReplace = searchTerm.replacingOccurrences(of: " ", with: "+")
        
       concenateURL = baseUrl
       concenateURL += searchTearmReplace
       concenateURL += apiKey
        
      // print(concenateURL)
        
        guard let fullUrl = URL(string : concenateURL) else {
            return
        }
        
      var fetch =   URLSession.shared.dataTask(with: fullUrl) { (data , respose, error) in
            if  error != nil{
                 let APIError = NSError(domain: "GiphySearch", code: 0, userInfo: [NSLocalizedFailureReasonErrorKey:"Unknown API response"])
                OperationQueue.main.addOperation ({
                    completion(nil, APIError)
                })
                print(error!)
            }else{
               
                 guard let data = data else { return }
                do{
                    let giphyResult = try JSONDecoder().decode(dataStruct.self, from: data)
                   
                    var giphyGifs = [giphyGif]()
                    
                    for gif in giphyResult.data{
                       guard let gifID = gif.id as? String,
                        let giFTittle = gif.title as? String else{
                            break
                        }
                        
                        let giphygif = giphyGif(id: gif.id, title: gif.title)
                        
                       // gif.images.fixed_height_still
                        guard let imageDataUrl = URL(string : gif.images.fixed_height_still.url) else {
                            return
                        }
                        let imageData =  try Data(contentsOf: imageDataUrl as URL)
                        if let image = UIImage(data: imageData){
                            giphygif.gif = image
                            giphyGifs.append(giphygif)
                        }
                        
                    }
                
                    
                    OperationQueue.main.addOperation({
                        completion(giphySearchResult(searchTerm : searchTerm , Gipgyresults : giphyGifs), nil)
                    })
                
                  
                } catch let errr as NSError {
                    print(errr)
                }
            }
        }
       
        fetch.resume()
        
    }
    
    
    
}
