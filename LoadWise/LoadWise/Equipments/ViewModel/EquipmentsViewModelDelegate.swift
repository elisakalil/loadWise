//
//  EquipmentsViewModelDelegate.swift
//  LoadWise
//
//  Created by Elisa Kalil on 02/07/23.
//

import Foundation

protocol EquipmentsViewModelDelegate: AnyObject {
    func updateControllCenter(date: String,
                      local: String,
                      totalPower: String,
                      typeOfConnection: String)
}
