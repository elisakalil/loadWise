//
//  AppliancesViewController.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

class AppliancesViewController: UIViewController {
    
    // MARK: PRIVATE PROPERTIES
    private var viewModel: AppliancesViewModelProtocol
    private var parameters: AppliancesParameters
    
    // MARK: PROPERTIES
    var contentView: AppliancesViewProtocol
    
    init(viewModel: AppliancesViewModel,
         parameters: AppliancesParameters,
         contentView: AppliancesViewProtocol)
    {
        self.viewModel = viewModel
        self.parameters = parameters
        self.contentView = contentView
        super.init(nibName: nil , bundle: nil)
        
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
                
        contentSetup()
        viewModel.updateControllCenter(regionality: parameters.regionalityType)
    }
    
    private func contentSetup() {
        view.addSubview(contentView)
        contentView.bindFrameToSuperviewBounds()
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
