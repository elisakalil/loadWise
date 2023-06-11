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
        button.backgroundColor = .red
        button.layer.cornerRadius = 12
        button.alpha = 0.5
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
            heightAnchor.constraint(equalToConstant: 110),
            
            button.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
            button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22),
            button.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -16),
            button.heightAnchor.constraint(equalToConstant: 90)
        ])
    }
}

extension FooterView: FooterViewProtocol {
    func updateButton(with text: String) {
        
        button.setTitle(text, for: .normal)
        button.tintColor = .white
    }
}
