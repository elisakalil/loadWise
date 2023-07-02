//
//  EquipmentsViewModelProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 02/07/23.
//

import Foundation

protocol EquipmentsViewModelProtocol {
    var delegate: EquipmentsViewModelDelegate? { get set }
    func updateControllCenter(regionality: String?)
}
