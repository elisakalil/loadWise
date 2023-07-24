//
//  RegionalityViewController.swift
//  LoadWise
//
//  Created by Elisa Kalil on 08/06/23.
//

import UIKit

class RegionalityViewController: UIViewController {
    
    let contentView: RegionalityViewProtocol = {
        RegionalityView()
    }()
    
    // MARK: PROPERTIES
    private let viewModel: RegionalityViewModelProtocol
    
    init(viewModel: RegionalityViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil , bundle: nil)
        
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = contentView
        contentView.delegate = self
        contentView.updateView()
    }
}

//MARK: RegionalityViewDelegate

extension RegionalityViewController: RegionalityViewDelegate {
    func buttonAction() {
        let regionality = viewModel.getSelectedRegionality()
        let viewModel = AppliancesViewModel()
        let dataSource = AppliancesTableViewDataSource()
        let contentView = AppliancesView(dataSource: dataSource)
        
        let nextVC = AppliancesViewController(viewModel: viewModel,
                                              parameters: .init(regionalityType: regionality),
                                              contentView: contentView)
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func handlerCardSelection(with selectedRegionality: String) {
        viewModel.handleSelectedRegionality(with: selectedRegionality)
    }
}

//MARK: RegionalityViewModelDelegate

extension RegionalityViewController: RegionalityViewModelDelegate {
    func updateSelector(with regionality: RegionalityType, isSelect: Bool) {
        contentView.updateSelector(with: regionality, isSelect: isSelect)
    }
}
