//
//  TagView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

class TagView: UIView {
    
    private let tagLabel: UILabel = {
        let label = UILabel()
        label.text = "12 kW"
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .white
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
        backgroundColor = .mediumGray
        
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(tagLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            tagLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            tagLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            tagLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            
        ])
    }
}

//MARK: TagViewProtocol

extension TagView: TagViewProtocol {
    func updateTag(text: String) {
        tagLabel.text = text
    }
}
