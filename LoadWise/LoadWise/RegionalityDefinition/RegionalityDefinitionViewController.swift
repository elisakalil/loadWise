//
//  RegionalityDefinition.swift
//  LoadWise
//
//  Created by Elisa Kalil on 08/06/23.
//

import UIKit

class RegionalityDefinitionViewController: UIViewController {

    // MARK: PROPERTIES
    
    let contentView: RegionalityDefinitionViewProtocol = {
        RegionalityDefinitionView()
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = contentView
        contentView.updateView()
    }
}

