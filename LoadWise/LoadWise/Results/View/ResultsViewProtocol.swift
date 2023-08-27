//
//  ResultsViewProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 30/07/23.
//

import Foundation
import UIKit

protocol ResultsViewProtocol where Self: UIView {
    var delegate: ResultsViewDelegate? { get set }
    
    func updateView(with title: String, with description: String?, with typeDescription: String?)
}
