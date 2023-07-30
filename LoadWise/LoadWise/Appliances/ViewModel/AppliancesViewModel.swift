//
//  AppliancesViewModel.swift
//  LoadWise
//
//  Created by Elisa Kalil on 02/07/23.
//

import Foundation
import UIKit

class AppliancesViewModel {
    // MARK: Public Initializers
    weak var delegate: AppliancesViewModelDelegate?
    
    // MARK: Private Initializers
    private var totalPower: Int = 0
    private var currentRegionality = ""
    
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd 'de' MMMM 'de' yyyy"

        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
    private func getTotalPower() -> String {
        return "\(totalPower) W"
    }
    
    private func getTypeOfConnection() -> String {
        if totalPower <= 15000 {
            return "Monofásica"
        } else if totalPower <= 25000 {
            return "Bifásica"
        } else { 
            return "Trifásica"
        }
    }
}
// MARK: EquipmentsViewModelProtocol
extension AppliancesViewModel: AppliancesViewModelProtocol {
    func calculateTotalPower(items: [AppliancesViewCellEntity]) {
        totalPower = 0
        
        for item in items {
            let power = item.power
            let quantity = item.quantity
            let powerForItem = power * quantity
            totalPower += powerForItem
        }
        updateControllCenter(regionality: currentRegionality)
    }
    
    
    func updateControllCenter(regionality: String?) {
        
        currentRegionality = regionality ?? .urbanSideTitle
        
        delegate?.updateControllCenter(date: getDate(),
                                       local: .santaCatarina,
                                       totalPower: getTotalPower(),
                                       typeOfConnection: getTypeOfConnection(),
                                       regionality: currentRegionality)
    }
    
    func getResults() -> ResultsParameters {
        .init(regionality: currentRegionality, totalPower: "\(totalPower)", type: getTypeOfConnection())
    }
}
