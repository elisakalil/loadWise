//
//  AppliancesModel.swift
//  LoadWise
//
//  Created by Elisa Kalil on 02/07/23.
//

import Foundation

class AppliancesModel {
    
    let name: String
    let icon: String
    let power: Int
    var quantity: Int = 0
    
    init(name: String,  icon: String, power: Int, quantity: Int = 0) {
        self.name = name
        self.icon = icon
        self.power = power
        self.quantity = quantity
    }
    
}
