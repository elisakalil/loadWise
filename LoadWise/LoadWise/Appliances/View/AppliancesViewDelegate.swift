//
//  AppliancesViewDelegate.swift
//  LoadWise
//
//  Created by Elisa Kalil on 02/07/23.
//

import Foundation

protocol AppliancesViewDelegate: AnyObject {
    func buttonAction()
    func calculateTotalPower(items: [AppliancesViewCellEntity])
    func updateControllCenter(date: String,
                              local: String,
                              totalPower: String,
                              typeOfConnection: String,
                              regionality: String?)
}
