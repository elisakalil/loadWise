//
//  SelectorView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 25/06/23.
//

import Foundation
import UIKit

class SelectorView: UIView {
    
    private let contentView: UIView = {
        let content = UIView()
        content.layer.cornerRadius = 4
        content.backgroundColor = .black
        content.alpha = 0.3
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "plus.circle.fill")?.withTintColor(.white)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    //MARK: INITIALIZERS
    
    private var wasSelected = false
    
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        buildHierarchy()
        setupConstraints()
    }
    
    private func buildHierarchy() {
        addSubview(contentView)
        addSubview(contentLabel)
        addSubview(contentIcon)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: 100),
            contentView.heightAnchor.constraint(equalToConstant: 40),

            contentIcon.widthAnchor.constraint(equalToConstant: 13),
            contentIcon.heightAnchor.constraint(equalToConstant: 13),
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 6),
            contentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),

            contentIcon.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            contentIcon.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            contentIcon.leadingAnchor.constraint(equalTo: contentLabel.trailingAnchor, constant: 5),
            contentIcon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
        ])
    }
    
    private func isSelected() {
        contentView.backgroundColor = .white
        contentView.alpha = 0.3
        
        contentLabel.text = "Selecionado"
        
        if let image = UIImage(systemName: "checkmark.circle.fill") {
            let coloredImage = image.withTintColor(.white, renderingMode: .alwaysOriginal)
            contentIcon.image = coloredImage
        }
        wasSelected = true
    }
    
    private func isNotSelected() {
        contentView.backgroundColor = .black
        contentView.alpha = 0.3
        
        contentLabel.text = "Selecionar"
        
        if let image = UIImage(systemName: "plus.circle.fill") {
            let coloredImage = image.withTintColor(.white, renderingMode: .alwaysOriginal)
            contentIcon.image = coloredImage
        }
        wasSelected = false
    }
}

extension SelectorView: SelectorViewProtocol {
    func updateSelector(isSelect: Bool) {
        guard isSelect else {
            isNotSelected()
            return
        }
        
        wasSelected ? isNotSelected() : isSelected()
    }
}
