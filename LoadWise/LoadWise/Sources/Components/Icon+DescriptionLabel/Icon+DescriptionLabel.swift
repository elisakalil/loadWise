//
//  Icon+DescriptionLabel.swift
//  LoadWise
//
//  Created by Elisa Kalil on 11/06/23.
//

import Foundation
import UIKit

class IconAndDescriptionLabel: UIView {
    private let iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "location")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = .systemFont(ofSize: 11)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        backgroundColor = .clear
        
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(iconImageView)
        addSubview(descriptionLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 12),
            
            iconImageView.topAnchor.constraint(equalTo: topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            iconImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 9),
            iconImageView.widthAnchor.constraint(equalToConstant: 8),
            
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 4),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}

extension IconAndDescriptionLabel: IconAndDescriptionLabelProtocol {
    func updateDescriptionLabel(with text: String) {
        descriptionLabel.text = text
    }
}
