//
//  EquipmentsViewController.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

class EquipmentsViewController: UIViewController {
    
    // MARK: PROPERTIES
    
    let contentView: EquipmentsViewProtocol = {
        let view = EquipmentsView()
        return view
    }()
    
    //MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view = contentView
    }
}
