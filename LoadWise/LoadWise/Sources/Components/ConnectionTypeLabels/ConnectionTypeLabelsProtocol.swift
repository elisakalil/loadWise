//
//  ConnectionTypeLabelsProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 06/08/23.
//

import Foundation
import UIKit

protocol ConnectionTypeLabelsProtocol where Self: UIView {
    func updateConnectionLabels(name: String,
                                description: String,
                                iconColor: UIColor)
}
