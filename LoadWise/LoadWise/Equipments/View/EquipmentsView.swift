//
//  EquipmentsView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

class EquipmentsView: UIView {
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = .selectYourEquipments
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let controllCenter: ControllCenterProtocol = {
        let card = ControllCenter()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    // MARK: INITIALIZERS
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: PRIVATE FUNCTIONS
    
    private func setup() {
        backgroundColor = .black
        
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(headerTitleLabel)
        addSubview(controllCenter)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            
            controllCenter.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: Metrics.Spacing.medium),
            controllCenter.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            controllCenter.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium)
        ])
    }
}

//MARK: EquipmentsViewProtocol

extension EquipmentsView: EquipmentsViewProtocol {
    func updateControllCenter(date: String,
                              local: String,
                              totalPower: String,
                              typeOfConnection: String,
                              regionality: String?)
    {
        controllCenter.updateControllCenter(date: date,
                                            local: local,
                                            totalPower: totalPower,
                                            typeOfConnection: typeOfConnection,
                                            regionality: regionality)
    }
}
