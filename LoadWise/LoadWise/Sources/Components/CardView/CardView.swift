//
//  CardView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 11/06/23.
//

import Foundation
import UIKit

class CardView: UIView {
    
    private let backgroundCardImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = Metrics.Radius.small
        image.alpha = 0.3
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let descriptionImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = Metrics.Radius.small
        image.layer.masksToBounds = true
        image.image = UIImage(named: "florest")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: IconAndDescriptionLabelProtocol = {
        let label = IconAndDescriptionLabel()
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
        backgroundColor = .black
        
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(backgroundCardImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(descriptionImageView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            backgroundCardImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundCardImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCardImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundCardImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backgroundCardImageView.heightAnchor.constraint(equalToConstant: Metrics.ImageSize.backgroundCardHeigth),
            backgroundCardImageView.widthAnchor.constraint(equalToConstant: Metrics.ImageSize.backgroundCardWidth),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundCardImageView.topAnchor, constant: 22),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundCardImageView.leadingAnchor, constant: 16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundCardImageView.leadingAnchor, constant: 16),
            
            descriptionImageView.trailingAnchor.constraint(equalTo: backgroundCardImageView.trailingAnchor, constant: -4),
            descriptionImageView.leadingAnchor.constraint(equalTo: backgroundCardImageView.leadingAnchor, constant: 4),
            descriptionImageView.bottomAnchor.constraint(equalTo: backgroundCardImageView.bottomAnchor, constant: -4),
            descriptionImageView.heightAnchor.constraint(equalToConstant: Metrics.ImageSize.descriptionCardHeigth),
            descriptionImageView.widthAnchor.constraint(equalToConstant: Metrics.ImageSize.descriptionCardcardWidth)
        ])
    }
}

extension CardView: CardViewProtocol {
    
    func updateCardView(backgroundImageName: String,
                        descriptionImage: String,
                        descriptionText: String,
                        title: String) {
        
        let image = UIImage(named: backgroundImageName) ?? UIImage(named: "default")
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRect(x: 0, y: 0, width: image?.size.width ?? .zero, height: image?.size.height ?? .zero)

        backgroundCardImageView.image = image
        titleLabel.text = title
        titleLabel.font = UIFont(name: "Georgia", size: 26)
        
        descriptionImageView.image = UIImage(named: descriptionImage)
        
        descriptionLabel.updateDescriptionLabel(with: descriptionText)
    }
}
