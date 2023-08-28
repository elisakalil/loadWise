//
//  ResultsViewController.swift
//  LoadWise
//
//  Created by Elisa Kalil on 30/07/23.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    
    // MARK: Private Initializers
    private var parameters: ResultsEntity
    private let viewModel: ResultsViewModelProtocol
    
    // MARK: Public Initializers
    var contentView: ResultsViewProtocol = {
        let view = ResultsView()
        return view
    }()
    
    init(parameters: ResultsEntity,
         viewModel: ResultsViewModelProtocol)
    {
        self.parameters = parameters
        self.viewModel = viewModel
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        contentSetup()
        updateView()
    }
    
    private func contentSetup() {
        contentView.delegate = self
        view = contentView
    }
    
    private func updateView() {
        guard let totalPower = Int(parameters.totalPower),
              totalPower > 0 else {
            contentView.updateView(with: .addEquipmentsTitle,
                                   with: .addEquipmentsDescription, with: nil)
            return
        }
        
        let title = viewModel.getTitle(with: totalPower)
        let description = viewModel.getDescription(with: totalPower)
        let type = viewModel.getType(with: totalPower)
        contentView.updateView(with: title, with: description, with: type)
    }
}

extension ResultsViewController: ResultsViewDelegate {
    func buttonAction() {
        
        let power = Int(parameters.totalPower) ?? 0
        
        let totalPower = parameters.totalPower
        let regionality = parameters.regionality
        let type = viewModel.getType(with: power)
        let selectedItems = parameters.selectedItems
        
        
        let nextVC = PDFExporterViewController(parameters: .init(regionality: regionality,
                                                                 totalPower: totalPower,
                                                                 type: type,
                                                                 selectedItems: selectedItems))
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
