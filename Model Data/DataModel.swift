//
//  DataModel.swift
//  Model Data
//
//  Created by Yuu on 18/09/21.
//

import Foundation

// Model product
struct DataModel : Identifiable {
    let id: Int
    let productName: String
    let productImage: String
    let productPrice: Int
    let location: String
    let rateCount: Int
    let rateTotal: Int
    
    init(id: Int, productname: String, productimage: String, productprice: Int, location: String, ratecount: Int, ratetotal: Int) {
        
        self.id = id
        self.productName = productname
        self.productImage = productimage
        self.productPrice = productprice
        self.location = location
        self.rateCount = ratecount
        self.rateTotal = ratetotal
    }
}
