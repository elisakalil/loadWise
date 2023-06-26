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

extension RegionalityViewController: RegionalityViewDelegate {
    func handlerCardSelection(with selectedRegionality: String) {
        viewModel.handlerCardSelection(with: selectedRegionality)
    }
}

extension RegionalityViewController: RegionalityViewModelDelegate {
    func updateSelector(with regionality: RegionalityType, isSelect: Bool) {
        contentView.updateSelector(with: regionality, isSelect: isSelect)
    }
}
