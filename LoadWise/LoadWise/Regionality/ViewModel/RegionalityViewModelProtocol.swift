//
//  RegionalityViewModelProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation

protocol RegionalityViewModelProtocol: AnyObject {
    var delegate: RegionalityViewModelDelegate? { get set }
    
    func handleSelectedRegionality(with selectedRegionality: String)
}
