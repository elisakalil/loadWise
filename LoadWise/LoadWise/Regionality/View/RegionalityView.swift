//
//  RegionalityView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 11/06/23.
//

import Foundation
import UIKit

class RegionalityView: UIView {
    
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
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = true
        scroll.indicatorStyle = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = Metrics.Spacing.medium
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
    
    private var selectedCard: String?
    weak var delegate: RegionalityViewDelegate?
    
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
        setupTapGesture()
    }
    
    private func buildViewHierarchy() {
        addSubview(headerTitleLabel)
        addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(countrysideCard)
        stackView.addArrangedSubview(urbanCard)
        stackView.addArrangedSubview(footer)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            
            scrollView.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: Metrics.Spacing.medium),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Metrics.Spacing.medium),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
    
    private func setupTapGesture() {
        let tapCountyGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectCountrySide))
        countrysideCard.addGestureRecognizer(tapCountyGesture)
        countrysideCard.isUserInteractionEnabled = true
        
        let tapUrbanGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectUrbanSide))
        urbanCard.addGestureRecognizer(tapUrbanGesture)
        urbanCard.isUserInteractionEnabled = true
    }
    
    @objc private func didSelectCountrySide() {
        countrysideCard.updateSelector(isSelect: true)
        delegate?.handlerCardSelection(with: RegionalityType.countrySide.rawValue)
    }
    
    @objc private func didSelectUrbanSide() {
        urbanCard.updateSelector(isSelect: true)
        delegate?.handlerCardSelection(with: RegionalityType.urbanSide.rawValue)
    }
}

extension RegionalityView: RegionalityViewProtocol {
    func updateSelector(with regionality: RegionalityType, isSelect: Bool) {
        if regionality == RegionalityType.countrySide {
            countrysideCard.updateSelector(isSelect: isSelect)
        }
        
        if regionality == RegionalityType.urbanSide {
            urbanCard.updateSelector(isSelect: isSelect)
        }
    }
    
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

extension RegionalityView: FooterViewDelegate {
    func buttonAction() {
        print("Hello")
        //TODO: delegate para VC
    }
}
