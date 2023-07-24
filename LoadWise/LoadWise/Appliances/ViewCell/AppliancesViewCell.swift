//
//  AppliancesViewCell.swift
//  LoadWise
//
//  Created by Elisa Kalil on 02/07/23.
//

import Foundation
import UIKit

class AppliancesViewCell: UITableViewCell {
    private let storageView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let icon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let powerDescriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "0"
        label.font = .boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
     let increaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     let decreaseButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    // MARK: PROPERTIES
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func increaseButtonTapped() {
        let currentValue = Int(quantityLabel.text ?? "0") ?? 0
        quantityLabel.text = "\(currentValue + 1)"
    }
    
    @objc func decreaseButtonTapped() {
        let currentValue = Int(quantityLabel.text ?? "0") ?? 0
        quantityLabel.text = "\(max(0, currentValue - 1))"
    }
    
    // MARK: Private Methods
    private func setup() {
        backgroundColor = .clear
        buildHierarchy()
        setupConstraints()
        
        increaseButton.addTarget(self, action: #selector(increaseButtonTapped), for: .touchUpInside)
        decreaseButton.addTarget(self, action: #selector(decreaseButtonTapped), for: .touchUpInside)
    }
    
    private func buildHierarchy() {
        addSubview(storageView)
                storageView.addSubview(icon)
                storageView.addSubview(titleLabel)
                storageView.addSubview(powerDescriptionLabel)
                storageView.addSubview(quantityLabel)
                storageView.addSubview(increaseButton)
                storageView.addSubview(decreaseButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            storageView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            storageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            storageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            storageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),

            icon.topAnchor.constraint(equalTo: storageView.topAnchor, constant: Metrics.Spacing.tiny),
            icon.leadingAnchor.constraint(equalTo: storageView.leadingAnchor, constant: Metrics.Spacing.tiny),
            icon.bottomAnchor.constraint(equalTo: storageView.bottomAnchor, constant: -Metrics.Spacing.tiny),
            icon.widthAnchor.constraint(equalToConstant: 50),
            icon.heightAnchor.constraint(equalToConstant: 50),
            
            titleLabel.topAnchor.constraint(equalTo: storageView.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: Metrics.Spacing.tiny),
            
            powerDescriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.Spacing.tiny),
            powerDescriptionLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: Metrics.Spacing.tiny),
            
            increaseButton.centerYAnchor.constraint(equalTo: storageView.centerYAnchor),
            increaseButton.trailingAnchor.constraint(equalTo: storageView.trailingAnchor, constant: -Metrics.Spacing.small),
            increaseButton.widthAnchor.constraint(equalToConstant: 30),
            increaseButton.heightAnchor.constraint(equalToConstant: 30),
            
            decreaseButton.centerYAnchor.constraint(equalTo: storageView.centerYAnchor),
            decreaseButton.trailingAnchor.constraint(equalTo: increaseButton.leadingAnchor, constant: -Metrics.Spacing.tiny),
            decreaseButton.widthAnchor.constraint(equalToConstant: 30),
            decreaseButton.heightAnchor.constraint(equalToConstant: 30),
            
            quantityLabel.topAnchor.constraint(equalTo: storageView.topAnchor, constant: Metrics.Spacing.medium),
            quantityLabel.trailingAnchor.constraint(equalTo: decreaseButton.leadingAnchor, constant: -Metrics.Spacing.small),
            quantityLabel.bottomAnchor.constraint(equalTo: storageView.bottomAnchor, constant: -Metrics.Spacing.medium),
        ])
    }
    
    // MARK: Setup Methods
    
    public func setDataCell(withData data: AppliancesViewCellEntity) {
        icon.image = UIImage(named: data.icon)
        titleLabel.text = data.title
        powerDescriptionLabel.text = data.power
        
        increaseButton.isUserInteractionEnabled = true
        decreaseButton.isUserInteractionEnabled = true
                    
        self.layoutIfNeeded()
    }
}
