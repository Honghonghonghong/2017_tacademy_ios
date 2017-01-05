//
//  Product.swift
//  listScene customCell
//
//  Created by Tacademy-Mac on 2017. 1. 5..
//  Copyright © 2017년 Tacademy-Mac. All rights reserved.
//

import Foundation

class Product {
    var code : String!
    var name : String!
    var price : String!
    var image : String!
    
    
    // Designated Initalizer
    init(code : String, name : String, price : String, image : String) {
        self.code = code
        self.name = name
        self.price = price
        self.image = image
    }
}
