//
//  RegionalityViewController.swift
//  LoadWise
//
//  Created by Elisa Kalil on 08/06/23.
//

import UIKit

class RegionalityViewController: UIViewController {

    // MARK: PROPERTIES
    
    let contentView: RegionalityViewProtocol = {
        RegionalityView()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = contentView
        contentView.updateView()
    }
}

