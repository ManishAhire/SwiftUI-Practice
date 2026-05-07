//
//  Product.swift
//  ObservablePropertyWrapper
//
//  Created by Manish Ahire on 19/02/26.
//

import SwiftUI

@Observable
class Product {
    var name: String
    var quntity: Int
    var isFavorite: Bool
    
    init(name: String, quntity: Int, isFavorite: Bool) {
        self.name = name
        self.quntity = quntity
        self.isFavorite = isFavorite
    }
}
