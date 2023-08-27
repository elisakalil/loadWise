//
//  ResultsView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 30/07/23.
//

import Foundation
import UIKit

class ResultsView: UIView {
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 38)
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
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .deepOrange
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.isHidden = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.isHidden = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstTag: TagWithIconViewProtocol = {
        let tag = TagWithIconView()
        tag.translatesAutoresizingMaskIntoConstraints = false
        return tag
    }()
    
    private let secondTag: TagWithIconViewProtocol = {
        let tag = TagWithIconView()
        tag.translatesAutoresizingMaskIntoConstraints = false
        return tag
    }()
    
    private let footer: FooterViewProtocol = {
        let footer = FooterView()
        footer.button.addTarget(ResultsView.self, action: #selector(buttonAction), for: .touchUpInside)
        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
    }()
    
    private let tagStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = Metrics.Spacing.small
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let connectionTypeCard: ConnectionTypeCardView = {
        let card = ConnectionTypeCardView()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
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
        
        setupFirstTapGesture()
        setupSecondTapGesture()
    }
    
    private func buildViewHierarchy() {
        addSubview(scrollView)
        addSubview(footer)
        
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(typeLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(tagStackView)
        stackView.addArrangedSubview(connectionTypeCard)
        
        tagStackView.addArrangedSubview(firstTag)
        tagStackView.addArrangedSubview(secondTag)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Metrics.Spacing.medium),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            tagStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -Metrics.Spacing.bigger),
            
            footer.topAnchor.constraint(equalTo: scrollView.bottomAnchor),
            footer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            footer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium)
        ])
    }
    
    private func setupFirstTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openFormLink))
        firstTag.addGestureRecognizer(tapGesture)
    }
    
    private func setupSecondTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openManualLink))
        secondTag.addGestureRecognizer(tapGesture)
    }
    
    @objc func openManualLink() {
        if let url = URL(string: "https://www.celesc.com.br/arquivos/normas-tecnicas/padrao-entrada/manual-simplificado-padrao-entrada-energia-eletrica.pdf") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    @objc func openFormLink() {
        if let url = URL(string: "https://celescdvat.omd.com.br/dvat/externo/cadastro.do") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    private func updateTags() {
        firstTag.updateTag(text: "Formulário online",
                           iconName: "plus",
                           shoulShowBackground: true)
        
        secondTag.updateTag(text: "Manual simplificado",
                            iconName: "book.fill",
                            shoulShowBackground: true)
    }
}

extension ResultsView: ResultsViewProtocol {
    
    func updateView(with title: String,
                    with description: String?,
                    with typeDescription: String?)
    {
        updateTags()
        titleLabel.text = title
        
        guard let description = description else {
            descriptionLabel.isHidden = true
            return
        }
        descriptionLabel.text = description

        
        guard let typeDescription = typeDescription else {
            typeLabel.isHidden = true
            return
        }
        typeLabel.text = typeDescription
    }
}
