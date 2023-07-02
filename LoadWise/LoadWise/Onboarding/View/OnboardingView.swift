//
//  OnboardingView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 08/06/23.
//

import Foundation
import UIKit

class OnboardingView: UIView {
    
    private let headerImageView: UIImageView = {
        let headerImage = UIImageView()
        let image = UIImage(named: "florest-gradient")
        headerImage.image = image
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        return headerImage
    }()
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = true
        scrollView.indicatorStyle = .white
        return scrollView
    }()
    
    private let contentScrollView: UIView = {
        let content = UIView()
        content.backgroundColor = .black
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var footer: FooterView = {
        let footer = FooterView()
        footer.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
    }()
    
    // MARK: INITIALIZERS
    
    weak var delegate: OnboardingViewDelegate?
    
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
        
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(headerImageView)
        addSubview(scrollView)
                
        scrollView.addSubview(contentScrollView)
        
        contentScrollView.addSubview(headerTitleLabel)
        contentScrollView.addSubview(descriptionLabel)
        contentScrollView.addSubview(footer)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            headerImageView.topAnchor.constraint(equalTo: topAnchor),
            headerImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerImageView.heightAnchor.constraint(equalToConstant: Metrics.ImageSize.heigth),
            
            scrollView.topAnchor.constraint(equalTo: headerImageView.bottomAnchor, constant: Metrics.Spacing.large),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentScrollView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentScrollView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            contentScrollView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.small),
            contentScrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                
            headerTitleLabel.topAnchor.constraint(equalTo: contentScrollView.topAnchor),
            headerTitleLabel.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            headerTitleLabel.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor, constant: -Metrics.Spacing.giant),
            
            descriptionLabel.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: Metrics.Spacing.medium),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            
            footer.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            footer.leadingAnchor.constraint(equalTo: contentScrollView.leadingAnchor),
            footer.trailingAnchor.constraint(equalTo: contentScrollView.trailingAnchor),
            footer.bottomAnchor.constraint(equalTo: contentScrollView.bottomAnchor)
        ])
    }
    
    private func setDescriptionLabelFontIfCould() {
        if let montserratFont = UIFont(name: "Montserrat", size: Metrics.Font.small) {
            descriptionLabel.font = montserratFont
        } else {
            descriptionLabel.font = UIFont.systemFont(ofSize: Metrics.Font.small)
        }
    }
    
    private func setDescriptionAttributeString() {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.lineSpacing = 4
        
        let attributedText = NSAttributedString(string: .onboarding, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        descriptionLabel.attributedText = attributedText
    }
}

//MARK: OnboardingViewProtocol

extension OnboardingView: OnboardingViewProtocol {
    
    func updateView() {
        headerTitleLabel.text = .loadBalancing
        footer.updateButton(with: .start)
        
        setDescriptionAttributeString()
        setDescriptionLabelFontIfCould()
    }
}
