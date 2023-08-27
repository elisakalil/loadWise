//
//  CardView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 11/06/23.
//

import Foundation
import UIKit

class CardView: UIView {
    
    private let backgroundCardImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = Metrics.Radius.small
        image.alpha = 0.3
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: IconAndDescriptionLabelProtocol = {
        let label = IconAndDescriptionLabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resumeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let selector: SelectorViewProtocol = {
        let selector = SelectorView()
        selector.translatesAutoresizingMaskIntoConstraints = false
        return selector
    }()
    
    private let tagView: TagWithIconViewProtocol = {
        let tag = TagWithIconView()
        tag.translatesAutoresizingMaskIntoConstraints = false
        return tag
    }()
        
    // MARK: INITIALIZERS
    
    init() {
        super.init(frame: .zero)
        setup()
        updateTag()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: PRIVATE FUNCTIONS
    
    private func setup() {
        backgroundColor = .black
        
        buildViewHierarchy()
        addConstraints()
        setupTapGesture()
        
        selector.updateSelector(isSelect: false)
    }
    
    private func buildViewHierarchy() {
        addSubview(backgroundCardImageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        addSubview(resumeLabel)
        addSubview(selector)
        addSubview(tagView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            backgroundCardImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundCardImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundCardImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundCardImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backgroundCardImageView.heightAnchor.constraint(equalToConstant: Metrics.ImageSize.backgroundCardHeigth),
            backgroundCardImageView.widthAnchor.constraint(equalToConstant: Metrics.ImageSize.backgroundCardWidth),
            
            descriptionLabel.topAnchor.constraint(equalTo: backgroundCardImageView.topAnchor, constant: 22),
            descriptionLabel.leadingAnchor.constraint(equalTo: backgroundCardImageView.leadingAnchor, constant: 16),
            
            titleLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundCardImageView.leadingAnchor, constant: 16),
            
            selector.topAnchor.constraint(equalTo: backgroundCardImageView.topAnchor, constant: 22),
            selector.trailingAnchor.constraint(equalTo: backgroundCardImageView.trailingAnchor, constant: -22),
            
            resumeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            resumeLabel.trailingAnchor.constraint(equalTo: backgroundCardImageView.trailingAnchor, constant: -16),
            resumeLabel.leadingAnchor.constraint(equalTo: backgroundCardImageView.leadingAnchor, constant: 16),
            
            tagView.topAnchor.constraint(equalTo: resumeLabel.bottomAnchor, constant: 16),
            tagView.trailingAnchor.constraint(equalTo: backgroundCardImageView.trailingAnchor, constant: -270),
            tagView.leadingAnchor.constraint(equalTo: backgroundCardImageView.leadingAnchor, constant: 16),
            tagView.bottomAnchor.constraint(equalTo: backgroundCardImageView.bottomAnchor, constant: -16),
        ])
    }
    
    private func updateTag() {
        tagView.updateTag(text: "Saiba",
                          iconName: "plus",
                          shoulShowBackground: false)
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openLink))
        tagView.addGestureRecognizer(tapGesture)
    }
    
    @objc func openLink() {
        if let url = URL(string: "https://www.celesc.com.br/ligacao-nova") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

extension CardView: CardViewProtocol {
    func updateSelector(isSelect: Bool) {
        selector.updateSelector(isSelect: isSelect)
    }
    
    
    func updateCardView(backgroundImageName: String,
                        descriptionImage: String,
                        descriptionText: String,
                        resumeText: String,
                        title: String) {
        
        let image = UIImage(named: backgroundImageName) ?? UIImage(named: "default")
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = CGRect(x: 0, y: 0, width: image?.size.width ?? .zero, height: image?.size.height ?? .zero)

        backgroundCardImageView.image = image
        titleLabel.text = title
        titleLabel.font = .systemFont(ofSize: 26)
                
        descriptionLabel.updateDescriptionLabel(with: descriptionText)
        
        resumeLabel.text = resumeText
        resumeLabel.font = UIFont.systemFont(ofSize: Metrics.Font.verySmall)
        setDescriptionAttributeString(text: resumeText)
    }
    
    func setDescriptionAttributeString(text: String) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.lineSpacing = 2
        
        let attributedText = NSAttributedString(string: text, attributes: [NSAttributedString.Key.paragraphStyle: paragraphStyle])
        
        resumeLabel.attributedText = attributedText
    }
}
