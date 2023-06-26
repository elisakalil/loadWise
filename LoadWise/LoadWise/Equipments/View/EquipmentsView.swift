//
//  EquipmentsView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

class EquipmentsView: UIView {
    
    private let countrysideCard: CardViewProtocol = {
        let card = CardView()
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
        addSubview(countrysideCard)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            countrysideCard.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            countrysideCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            countrysideCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            countrysideCard.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension EquipmentsView: EquipmentsViewProtocol {
    
}
