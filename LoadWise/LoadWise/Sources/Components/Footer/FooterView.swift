//
//  FooterView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 11/06/23.
//

import Foundation
import UIKit

class FooterView: UIView {
    private let button: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1.0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
        addSubview(button)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 100),
            
            button.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -24),
            button.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
}

extension FooterView: FooterViewProtocol {
    func updateButton(with text: String) {
        
        button.setTitle(text, for: .normal)
        button.tintColor = .white
    }
}
