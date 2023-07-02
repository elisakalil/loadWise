//
//  ControllCenterProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 27/06/23.
//

import Foundation
import UIKit

protocol ControllCenterProtocol where Self: UIView {
    func updateControllCenter(date: String,
                              local: String,
                              totalPower: String,
                              typeOfConnection: String,
                              regionality: String?)
}
