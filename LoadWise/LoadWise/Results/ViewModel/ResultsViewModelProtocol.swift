//
//  ResultsViewModelProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 30/07/23.
//

import Foundation

protocol ResultsViewModelProtocol {
    func getTitle(with totalPower: Int) -> String
    func getType(with totalPower: Int) -> String
    func getDescription(with totalPower: Int) -> String
}
