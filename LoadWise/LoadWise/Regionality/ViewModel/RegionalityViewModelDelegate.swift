//
//  RegionalityViewModelDelegate.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation

protocol RegionalityViewModelDelegate: AnyObject {
    func updateSelector(with regionality: RegionalityType, isSelect: Bool)
}
