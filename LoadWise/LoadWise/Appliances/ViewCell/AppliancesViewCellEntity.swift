//
//  AppliancesViewCellEntity.swift
//  LoadWise
//
//  Created by Elisa Kalil on 16/07/23.
//

import UIKit

class AppliancesViewCellEntity {
    var title: String
    var power: Int
    var icon: String
    var quantity: Int
    
    init(title: String, power: Int, icon: String, quantity: Int) {
        self.title = title
        self.power = power
        self.icon = icon
        self.quantity = quantity
    }
}
