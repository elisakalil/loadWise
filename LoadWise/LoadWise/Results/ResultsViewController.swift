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
    private var parameters: ResultsParameters
    
    // MARK: Public Initializers
    var contentView: ResultsViewProtocol = {
        let view = ResultsView()
        return view
    }()
    
    init(parameters: ResultsParameters)
    {
        self.parameters = parameters
        super.init(nibName: nil , bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
                
        contentSetup()
    }
    
    private func contentSetup() {
        contentView.delegate = self
        
        view = contentView
        contentView.updateView(with: parameters.totalPower, with: nil)
    }
}

extension ResultsViewController: ResultsViewDelegate {
    func buttonAction() {
        print("button tapped")
    }
}
