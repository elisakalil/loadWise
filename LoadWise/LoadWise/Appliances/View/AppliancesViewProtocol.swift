//
//  AppliancesViewProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

protocol AppliancesViewProtocol where Self: UIView {
    var delegate: AppliancesViewDelegate? { get set }
    
    func updateControllCenter(date: String,
                              local: String,
                              totalPower: String,
                              typeOfConnection: String,
                              regionality: String?)
}
