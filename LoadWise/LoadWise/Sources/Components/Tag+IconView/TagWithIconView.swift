//
//  TagWithIconView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 31/07/23.
//

import Foundation
import UIKit

class TagWithIconView: UIView {
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let tagIcon: UIImageView = {
        let label = UIImageView()
        label.translatesAutoresizingMaskIntoConstraints = false
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
        self.layer.cornerRadius = 4
        
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(tagLabel)
        addSubview(tagIcon)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 20),
            
            tagLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            tagLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            
            tagIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            tagIcon.leadingAnchor.constraint(equalTo: tagLabel.trailingAnchor, constant: 4),
            tagIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            tagIcon.widthAnchor.constraint(equalToConstant: 7),
            tagIcon.heightAnchor.constraint(equalToConstant: 7)
        ])
    }
}

//MARK: TagViewProtocol

extension TagWithIconView: TagWithIconViewProtocol {
    func updateTag(text: String, iconName: String, shoulShowBackground: Bool) {
        tagLabel.text = text
        
        let symbolConfiguration = UIImage.SymbolConfiguration(scale: .small)
        tagIcon.image = UIImage(systemName: iconName, withConfiguration: symbolConfiguration)?.tinted(with: .white) 

        if shoulShowBackground {
            backgroundColor = .darkGray
        } else {
            backgroundColor = .white.withAlphaComponent(0.3)
        }
    }
}
