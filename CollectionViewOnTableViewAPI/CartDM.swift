//
//  CartDM.swift
//  CollectionViewOnTableViewAPI
//
//  Created by Smita Kankayya on 12/06/24.
//

import Foundation

struct CartDM: Decodable {
    let carts: [Cart]
}

struct Cart: Decodable {
   let products: [Product]
}

struct Product: Decodable {
    let thumbnail: String
}
