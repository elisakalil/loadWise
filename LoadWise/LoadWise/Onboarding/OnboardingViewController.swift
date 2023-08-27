//
//  OnboardingViewController.swift
//  LoadWise
//
//  Created by Elisa Kalil on 08/06/23.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: Properties
    let contentView: OnboardingViewProtocol = {
        let view = OnboardingView()
        return view
    }()
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.delegate = self
        
        view = contentView
        view.backgroundColor = .black
        navigationController?.navigationBar.barTintColor = .black
        contentView.updateView()
    }
}


//MARK: OnboardingViewDelegate

extension OnboardingViewController: OnboardingViewDelegate {
    func buttonAction() {
        let viewModel = RegionalityViewModel()
        let nextVC = RegionalityViewController(viewModel: viewModel)
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
