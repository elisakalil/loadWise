//
//  TagWithIconViewProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 31/07/23.
//

import Foundation
import UIKit

protocol TagWithIconViewProtocol where Self: UIView {
    func updateTag(text: String,
                   iconName: String,
                   shoulShowBackground: Bool)
}
