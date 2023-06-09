//
//  OnboardingViewProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 08/06/23.
//

import Foundation
import UIKit

protocol OnboardingViewProtocol where Self: UIView {
    
    var delegate: OnboardingViewDelegate? { get set }
    
    func updateView()
}
