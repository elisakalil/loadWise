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
    private var alertShowed = false
    
    // MARK: Public Initializers
    var contentView: AppliancesViewProtocol
    let alertController = UIAlertController(title: "Atenção", message: .reachPowerLimit, preferredStyle: .alert)
    let doneAction = UIAlertAction(title: "Ok", style: .default) { action in }
    let moreAction = UIAlertAction(title: "Saiba mais", style: .default) { action in
        if let deepLinkURL = URL(string: "https://www.celesc.com.br/ligacao-nova") {
            if UIApplication.shared.canOpenURL(deepLinkURL) {
                UIApplication.shared.open(deepLinkURL, options: [:], completionHandler: nil)
            }
        }
    }
    
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
    
    private func setupDeepLink() {
        viewModel.updateControllCenter(regionality: parameters.regionalityType)
    }
    
    private func showAlertIfNeeded() {
        if viewModel.getTotalPower() > 65000  && !alertShowed {
            alertController.addAction(doneAction)
            alertController.addAction(moreAction)
            present(alertController, animated: true, completion: nil)
            
            alertShowed = true
        }
    }
}

//MARK: AppliancesViewDelegate
extension AppliancesViewController: AppliancesViewDelegate {
    func calculateTotalPower(items: [AppliancesViewCellEntity]) {
        viewModel.calculateTotalPower(items: items)
    }
    
    func updateItems(items: [AppliancesViewCellEntity]) {
        viewModel.updateItems(items: items)
        showAlertIfNeeded()
    }
    
    func buttonAction() {
        let results = viewModel.getResults()
        let viewModel = ResultsViewModel()
        
        let nextVC = ResultsViewController(parameters: results, viewModel: viewModel)
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
