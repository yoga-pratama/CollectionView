//
//  giphySearchResult.swift
//  CollectionView
//
//  Created by Yoga Pratama on 24/10/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import Foundation

struct giphyDataRest: Decodable {
    let data : innerItem
}

struct innerItem {
    let id : String
    let url: String
}
