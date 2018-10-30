//
//  giphyGif.swift
//  CollectionView
//
//  Created by Yoga Pratama on 30/10/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import Foundation
import UIKit
class giphyGif: Equatable {
    var id: String
    var gif: UIImage?
    var title : String
    
    init(id:String , title : String  ) {
        self.id = id
        self.title = title
    }
    
    
}

 func == (lhs: giphyGif, rhs: giphyGif) -> Bool {
    return lhs.id == rhs.id
}
