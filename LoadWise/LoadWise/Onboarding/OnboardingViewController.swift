//
//  OnboardingViewController.swift
//  LoadWise
//
//  Created by Elisa Kalil on 08/06/23.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: PROPERTIES
    
    let contentView: OnboardingViewProtocol = {
        OnboardingView()
    }()
    
    //MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = contentView
        contentView.updateView()
    }
}
