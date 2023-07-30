//
//  ResultsView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 30/07/23.
//

import Foundation
import UIKit

class ResultsView: UIView {
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = true
        scroll.indicatorStyle = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = Metrics.Spacing.medium
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let missingPowerLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .orange
        label.font = UIFont.systemFont(ofSize: 10)
        label.isHidden = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let footer: FooterViewProtocol = {
        let footer = FooterView()
        footer.button.addTarget(ResultsView.self, action: #selector(buttonAction), for: .touchUpInside)
        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
    }()
    
    // MARK: Properties
    weak var delegate: ResultsViewDelegate?
    
    // MARK: INITIALIZERS
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc public func buttonAction() {
        delegate?.buttonAction()
    }
    
    // MARK: PRIVATE FUNCTIONS
    
    private func setup() {
        backgroundColor = .black
        footer.updateButton(with: .proceed)
        
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(headerTitleLabel)
        addSubview(scrollView)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(missingPowerLabel)
        stackView.addArrangedSubview(footer)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            
            scrollView.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: Metrics.Spacing.medium),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Metrics.Spacing.medium),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.large),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.large),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
    }
}

extension ResultsView: ResultsViewProtocol {
    func updateView(with totalPower: String, with missingPower: String?) {
        headerTitleLabel.text = "Você precisará de \(totalPower) W de fornecimento de energia."
        
        guard let power = missingPower else {
            missingPowerLabel.isHidden = true
            return
        }
        
        missingPowerLabel.text = power
    }
}
