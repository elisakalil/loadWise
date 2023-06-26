//
//  RegionalityViewModel.swift
//  LoadWise
//
//  Created by Elisa Kalil on 25/06/23.
//

import Foundation

class RegionalityViewModel {
    //MARK: PROPERTIES
    
    private var regionality: String?
    weak var delegate: RegionalityViewModelDelegate?
}

extension RegionalityViewModel: RegionalityViewModelProtocol {
    
    func handlerCardSelection(with selectedRegionality: String) {
        guard regionality != nil,
              regionality != selectedRegionality else {
            if selectedRegionality == RegionalityType.countrySide.rawValue {
                delegate?.updateSelector(with: RegionalityType.urbanSide, isSelect: false)
            } else {
                delegate?.updateSelector(with: RegionalityType.countrySide, isSelect: false)
            }
            return
        }
        if selectedRegionality == RegionalityType.countrySide.rawValue {
            delegate?.updateSelector(with: RegionalityType.urbanSide, isSelect: false)
        } else {
            delegate?.updateSelector(with: RegionalityType.countrySide, isSelect: false)
        }
        regionality = selectedRegionality
    }
}

//private func handlerCardSelection(with selectedRegionality: String) {
//    guard selectedRegionality != nil,
//          selectedRegionality != selectedRegionality else {
//        if selectedRegionality == RegionalityType.countrySide.rawValue {
//            urbanCard.updateSelector(isSelect: false)
//        } else {
//            countrysideCard.updateSelector(isSelect: false)
//        }
//        return
//    }
//    if selectedRegionality == RegionalityType.countrySide.rawValue {
//        urbanCard.updateSelector(isSelect: false)
//    } else {
//        countrysideCard.updateSelector(isSelect: false)
//    }
//    selectedRegionality = selectedRegionality
//}
