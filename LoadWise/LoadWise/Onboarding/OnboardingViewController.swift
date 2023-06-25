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
        let view = OnboardingView()
        return view
    }()
    
    //MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        
        view = contentView
        contentView.updateView()
    }
}


//MARK: OnboardingViewDelegate

extension OnboardingViewController: OnboardingViewDelegate {
    func buttonAction() {
        let nextVC = RegionalityDefinitionViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
