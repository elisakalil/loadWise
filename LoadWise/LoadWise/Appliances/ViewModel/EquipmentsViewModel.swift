//
//  AppliancesViewModel.swift
//  LoadWise
//
//  Created by Elisa Kalil on 02/07/23.
//

import Foundation

class AppliancesViewModel {
    // MARK: PROPERTIES
    weak var delegate: AppliancesViewModelDelegate?
    
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd 'de' MMMM 'de' yyyy"

        let currentDate = Date()
        let formattedDate = dateFormatter.string(from: currentDate)
        
        return formattedDate
    }
    
    private func getTotalPower() -> String {
        return "12 kW"
    }
    
    private func getTypeOfConnection() -> String {
        return RegionalityType.urbanSide.rawValue
    }

}
// MARK: EquipmentsViewModelProtocol
extension AppliancesViewModel: AppliancesViewModelProtocol {
    func updateControllCenter(regionality: String?) {
        delegate?.updateControllCenter(date: getDate(),
                                       local: .santaCatarina,
                                       totalPower: getTotalPower(),
                                       typeOfConnection: getTypeOfConnection(),
                                       regionality: regionality)
    }
}
