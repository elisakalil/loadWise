//
//  ConnectionTypeCardView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 06/08/23.
//

import Foundation
import UIKit

class ConnectionTypeCardView: UIView {
    private let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Diferença no custo de medição"
        label.font = .boldSystemFont(ofSize: 8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "circle.fill")?.tinted(with: .white)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "dados referêntes à Celesc /2023"
        label.font = .boldSystemFont(ofSize: 8)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorLine: UIView = {
        let line = UILabel()
        line.backgroundColor = .white
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    private let typesStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = Metrics.Spacing.bigger
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let monofasicLabel: ConnectionTypeLabelsProtocol = {
        let label = ConnectionTypeLabels()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.updateConnectionLabels(name: "Monofásico para Bifásico", description: "+ R$ 120,91", iconColor: .lightGreen)
        return label
    }()
    
    private let bifasicLabel: ConnectionTypeLabelsProtocol = {
        let label = ConnectionTypeLabels()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.updateConnectionLabels(name: "Monofásico para Trifásico", description: "+ R$ 147,75", iconColor: .lightCyan)
        return label
    }()
    
    private let trifasicLabel: ConnectionTypeLabelsProtocol = {
        let label = ConnectionTypeLabels()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.updateConnectionLabels(name: "Bifásico para Trifásico", description: "+ R$ 26,80", iconColor: .lightOrange)
        return label
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
        layer.cornerRadius = 8
        backgroundColor = .superDarkGray
        
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(infoLabel)
        addSubview(separatorIcon)
        addSubview(dateLabel)
        addSubview(separatorLine)
        
        addSubview(typesStack)
        
        typesStack.addArrangedSubview(monofasicLabel)
        typesStack.addArrangedSubview(bifasicLabel)
        typesStack.addArrangedSubview(trifasicLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.small),
            infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.small),
            
            separatorIcon.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.medium),
            separatorIcon.leadingAnchor.constraint(equalTo: infoLabel.trailingAnchor, constant: Metrics.Spacing.tiny),
            separatorIcon.widthAnchor.constraint(equalToConstant: 4),
            separatorIcon.heightAnchor.constraint(equalToConstant: 4),
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.small),
            dateLabel.leadingAnchor.constraint(equalTo: separatorIcon.trailingAnchor, constant: Metrics.Spacing.tiny),
            
            separatorLine.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: Metrics.Spacing.tiny),
            separatorLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            separatorLine.trailingAnchor.constraint(equalTo: trailingAnchor),
            separatorLine.heightAnchor.constraint(equalToConstant: 0.3),
            
            typesStack.topAnchor.constraint(equalTo: separatorLine.bottomAnchor, constant: Metrics.Spacing.bigger),
            typesStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.small),
            typesStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.small),
            typesStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.Spacing.medium)
        ])
    }
}

