//
//CardViewProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 11/06/23.
//

import Foundation
import UIKit

protocol CardViewProtocol where Self: UIView {

    func updateCardView(backgroundImageName: String,
                        descriptionImage: String,
                        descriptionText: String,
                        title: String)
    
    func updateSelector(isSelect: Bool)
}
