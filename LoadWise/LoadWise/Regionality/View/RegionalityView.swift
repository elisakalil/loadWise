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
    
    private let contentStackView: UIStackView = {
        let content = UIStackView()
        content.backgroundColor = .black
        content.alignment = .center
        content.axis = .vertical
        content.spacing = Metrics.Spacing.small
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
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
    
    private lazy var footer: FooterView = {
        let footer = FooterView()
        footer.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
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
    
    @objc public func buttonAction() {
        delegate?.buttonAction()
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
        addSubview(footer)

        addSubview(urbanCard)
        addSubview(countrysideCard)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.Spacing.large),
            headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large),
            headerTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large),
                
            countrysideCard.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: Metrics.Spacing.bigger),
            countrysideCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            countrysideCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            
            urbanCard.topAnchor.constraint(equalTo: countrysideCard.bottomAnchor, constant: Metrics.Spacing.medium),
            urbanCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            urbanCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            
            footer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            footer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
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

//MARK: RegionalityViewProtocol

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
        headerTitleLabel.text = .selectYourRegionality
        
        countrysideCard.updateCardView(backgroundImageName: "countryside-background",
                                       descriptionImage: "florest",
                                       descriptionText: .countySideDescription,
                                       resumeText: .countySideResume,
                                       title: .countySideTitle)
        urbanCard.updateCardView(backgroundImageName: "urbanArea-background",
                                 descriptionImage: "urbanArea",
                                 descriptionText: .urbanSideDescription,
                                 resumeText: .urbanSideResume,
                                 title: .urbanSideTitle)
        
        footer.updateButton(with: .proceed)
    }
}
