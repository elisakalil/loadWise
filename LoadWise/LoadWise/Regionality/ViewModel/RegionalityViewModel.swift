//
//  RegionalityViewModel.swift
//  LoadWise
//
//  Created by Elisa Kalil on 25/06/23.
//

import Foundation
import UIKit

class RegionalityViewModel {
    
    //MARK: PROPERTIES
    private var regionality: String?
    weak var delegate: RegionalityViewModelDelegate?
    
    private func toggleRegionalitySelection(selectedRegionality: String) {
        if selectedRegionality == RegionalityType.countrySide.rawValue {
            delegate?.updateSelector(with: RegionalityType.urbanSide, isSelect: false)
        } else {
            delegate?.updateSelector(with: RegionalityType.countrySide, isSelect: false)
        }
    }
}

//MARK: RegionalityViewModelProtocol
extension RegionalityViewModel: RegionalityViewModelProtocol {
    func getSelectedRegionality() -> String? {
        return regionality ?? nil
    }
    
    
    func handleSelectedRegionality(with selectedRegionality: String) {
        guard regionality != selectedRegionality else {
           toggleRegionalitySelection(selectedRegionality: selectedRegionality)
            regionality = nil
            return
        }
        toggleRegionalitySelection(selectedRegionality: selectedRegionality)
        regionality = selectedRegionality
    }
}
