//
//  AppliancesViewController.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

class AppliancesViewController: UIViewController {
    
    // MARK: Private Initializers
    private var viewModel: AppliancesViewModelProtocol
    private var parameters: AppliancesParameters
    
    // MARK: Public Initializers
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
        self.contentView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
                
        contentSetup()
        updateControlCenter()
    }
    
    private func contentSetup() {
        view.addSubview(contentView)
        contentView.bindFrameToSuperviewBounds()
    }
    
    private func updateControlCenter() {
        viewModel.updateControllCenter(regionality: parameters.regionalityType)
    }
}

//MARK: AppliancesViewDelegate
extension AppliancesViewController: AppliancesViewDelegate {
    func calculateTotalPower(items: [AppliancesViewCellEntity]) {
        viewModel.calculateTotalPower(items: items)
    }
    
    func buttonAction() {
        let results = viewModel.getResults()
        let nextVC = ResultsViewController(parameters: results)
        navigationController?.pushViewController(nextVC, animated: true)
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
