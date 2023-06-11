//
//  RegionalityDefinitionView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 11/06/23.
//

import Foundation
import UIKit

class RegionalityDefinitionView: UIView {
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 45)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = Metrics.Spacing.tiny
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let countrysideCard: CardViewProtocol = {
        let card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private let urbanCard: CardViewProtocol = {
        let card = CardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private let footer: FooterViewProtocol = {
        let footer = FooterView()
        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
    }()
    
    // MARK: INITIALIZERS
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
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
        addSubview(stackView)
        
        stackView.addArrangedSubview(countrysideCard)
        stackView.addArrangedSubview(urbanCard)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            
            stackView.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: Metrics.Spacing.medium),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large),
        ])
    }
}

extension RegionalityDefinitionView: RegionalityDefinitionViewProtocol {
    func updateView() {
        headerTitleLabel.text = "Selecione a sua regionalidade"
        
        countrysideCard.updateCardView(backgroundImageName: "countryside-background",
                                       descriptionImage: "florest",
                                       descriptionText: "Agricultura, pecuária e extrativismo.",
                                       title: "Área rural")
        urbanCard.updateCardView(backgroundImageName: "urbanArea-background",
                                 descriptionImage: "urbanArea",
                                 descriptionText: "Cidade de grande, médio e pequeno porte.",
                                 title: "Área urbana")
        
        footer.updateButton(with: "Continuar")
    }
}
