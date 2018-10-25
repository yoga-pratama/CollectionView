//
//  dataStruct.swift
//  CollectionView
//
//  Created by Yoga Pratama on 25/10/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import Foundation
import UIKit

/// for json
struct dataStruct : Decodable {
    let data : [innerData]
}

struct innerData : Decodable {
    let id : String
    let url: String
    let title : String
    let images : imageData
}


struct  imageData :Decodable {
   let  fixed_height_still : imageURL
}

struct imageURL : Decodable {
  let  url : String
}


// for internal object
struct gifImage{
    let gif : UIImage
    let id  : String
    let title : String
}
