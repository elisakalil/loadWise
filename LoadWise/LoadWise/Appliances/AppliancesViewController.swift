//
//  AppliancesViewController.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

class AppliancesViewController: UIViewController {
    
    // MARK: PROPERTIES
    private var viewModel: AppliancesViewModelProtocol
    private var parameters: AppliancesParameters
    
    private let contentView: AppliancesViewProtocol = {
        let view = AppliancesView()
        return view
    }()
    
    init(viewModel: AppliancesViewModel, parameters: AppliancesParameters) {
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
extension AppliancesViewController: AppliancesViewModelDelegate {
    func updateControllCenter(date: String,
                              local: String,
                              totalPower: String,
                              typeOfConnection: String,
                              regionality: String?)
    {
        contentView.updateControllCenter(date: date,
                                         local: local,
                                         totalPower: totalPower,
                                         typeOfConnection: typeOfConnection,
                                         regionality: regionality)
    }
}
