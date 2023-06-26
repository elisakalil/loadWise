//
//  RegionalityViewProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 11/06/23.
//

import Foundation
import UIKit

protocol RegionalityViewProtocol where Self: UIView {
    var delegate: RegionalityViewDelegate? { get set }
    
    func updateView()
    func updateSelector(with regionality: RegionalityType, isSelect: Bool)
}
