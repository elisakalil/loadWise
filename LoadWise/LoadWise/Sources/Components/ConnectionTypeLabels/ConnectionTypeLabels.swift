//
//  ConnectionTypeLabels.swift
//  LoadWise
//
//  Created by Elisa Kalil on 06/08/23.
//

import Foundation
import UIKit

class ConnectionTypeLabels: UIView {
    private let typeNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize:16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let typeIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "paperplane.circle")?.withTintColor(.white)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
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
        addSubview(typeIcon)
        addSubview(typeNameLabel)
        addSubview(typeDescriptionLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            typeIcon.topAnchor.constraint(equalTo: topAnchor),
            typeIcon.leadingAnchor.constraint(equalTo: leadingAnchor),
            typeIcon.heightAnchor.constraint(equalToConstant: 18),
            typeIcon.widthAnchor.constraint(equalToConstant: 18),
            
            typeNameLabel.topAnchor.constraint(equalTo: topAnchor),
            typeNameLabel.leadingAnchor.constraint(equalTo: typeIcon.trailingAnchor, constant: Metrics.Spacing.small),
            typeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            typeDescriptionLabel.topAnchor.constraint(equalTo: typeNameLabel.bottomAnchor, constant: Metrics.Spacing.tiny),
            typeDescriptionLabel.leadingAnchor.constraint(equalTo: typeIcon.trailingAnchor, constant: Metrics.Spacing.small),
            typeDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            typeDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension ConnectionTypeLabels: ConnectionTypeLabelsProtocol {
    func updateConnectionLabels(name: String,
                                description: String,
                                iconColor: UIColor) {
        typeNameLabel.text = name
        typeDescriptionLabel.text = description

        if let tintedIcon = UIImage(systemName: "hand.raised.square.on.square.fill")?.tinted(with: iconColor) {
            typeIcon.image = tintedIcon
        }
    }
}

