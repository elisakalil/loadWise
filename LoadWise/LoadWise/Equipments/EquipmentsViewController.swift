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
    private var viewModel: EquipmentsViewModelProtocol
    private var parameters: EquipmentsParameters
    
    private let contentView: EquipmentsViewProtocol = {
        let view = EquipmentsView()
        return view
    }()
    
    init(viewModel: EquipmentsViewModel, parameters: EquipmentsParameters) {
        self.viewModel = viewModel
        self.parameters = parameters
        super.init(nibName: nil , bundle: nil)
        
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
                
        view = contentView
        viewModel.updateControllCenter(regionality: parameters.regionalityType)
    }
    
}

// MARK: EquipmentsViewController
extension EquipmentsViewController: EquipmentsViewModelDelegate {
    func updateControllCenter(date: String,
                              local: String,
                              totalPower: String,
                              typeOfConnection: String,
                              regionality: String?) {
        contentView.updateControllCenter(date: date,
                                         local: local,
                                         totalPower: totalPower,
                                         typeOfConnection: typeOfConnection,
                                         regionality: regionality)
    }
}
