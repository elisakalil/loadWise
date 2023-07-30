//
//  AppliancesViewModelProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 02/07/23.
//

import Foundation

protocol AppliancesViewModelProtocol {
    var delegate: AppliancesViewModelDelegate? { get set }
    func updateControllCenter(regionality: String?)
    func calculateTotalPower(items: [AppliancesViewCellEntity])
    func getResults() -> ResultsParameters
}
