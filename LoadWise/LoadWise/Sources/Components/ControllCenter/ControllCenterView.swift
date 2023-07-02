//
//  ControllCenterView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

class ControllCenter: UIView {
    private let localLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorIcon: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "circle.fill")?.withTintColor(.white)
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let regionalityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 12)
        label.isHidden = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalPowerTitle: UILabel = {
        let label = UILabel()
        label.text = .totalPowerSelected
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 27)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let totalPowerTag: TagViewProtocol = {
        let tag = TagView()
        tag.translatesAutoresizingMaskIntoConstraints = false
        return tag
    }()
    
    private let typeTag: TagViewProtocol = {
        let tag = TagView()
        tag.translatesAutoresizingMaskIntoConstraints = false
        return tag
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
        backgroundColor = .darkGray
        
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(localLabel)
        addSubview(separatorIcon)
        addSubview(dateLabel)
        
        addSubview(regionalityLabel)
        
        addSubview(totalPowerTitle)
        
        addSubview(totalPowerTag)
        addSubview(typeTag)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            localLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.small),
            localLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.small),
            
            separatorIcon.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.medium),
            separatorIcon.leadingAnchor.constraint(equalTo: localLabel.trailingAnchor, constant: Metrics.Spacing.tiny),
            separatorIcon.widthAnchor.constraint(equalToConstant: 6),
            separatorIcon.heightAnchor.constraint(equalToConstant: 6),
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: Metrics.Spacing.small),
            dateLabel.leadingAnchor.constraint(equalTo: separatorIcon.trailingAnchor, constant: Metrics.Spacing.tiny),
            
            regionalityLabel.topAnchor.constraint(equalTo: localLabel.bottomAnchor, constant: Metrics.Spacing.tiny),
            regionalityLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.small),
            
            totalPowerTitle.topAnchor.constraint(equalTo: regionalityLabel.bottomAnchor, constant: Metrics.Spacing.medium),
            totalPowerTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.small),
            
            totalPowerTag.topAnchor.constraint(equalTo: totalPowerTitle.bottomAnchor, constant: Metrics.Spacing.small),
            totalPowerTag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.small),
            totalPowerTag.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.Spacing.small),
            
            typeTag.leadingAnchor.constraint(equalTo: totalPowerTag.trailingAnchor, constant: Metrics.Spacing.small),
            typeTag.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Metrics.Spacing.small)
        ])
    }
}

//MARK: ControllCenterProtocol

extension ControllCenter: ControllCenterProtocol {
    func updateControllCenter(date: String,
                              local: String,
                              totalPower: String,
                              typeOfConnection: String,
                              regionality: String?)
    {
        localLabel.text = local
        dateLabel.text = date
        
        totalPowerTag.updateTag(text: totalPower)
        typeTag.updateTag(text: typeOfConnection)
        
        guard regionality != nil else {
            regionalityLabel.isHidden = true
            return
        }
        regionalityLabel.text = "Regionalidade: \(regionality ?? "")"
    }
}
