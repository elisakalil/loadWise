//
//  AppliancesViewCellEntity.swift
//  LoadWise
//
//  Created by Elisa Kalil on 16/07/23.
//

import UIKit

class AppliancesViewCellEntity {
    var title: String
    var power: String
    var icon: String
    
    init(title: String, power: String, icon: String) {
        self.title = title
        self.power = power
        self.icon = icon
    }
}
