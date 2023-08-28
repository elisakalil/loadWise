//
//  PDFExporterView.swift.swift
//  LoadWise
//
//  Created by Elisa Kalil on 27/08/23.
//

import UIKit

class PDFExporterView: UIView, PDFExporterViewProtocol {
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.showsVerticalScrollIndicator = true
        scroll.indicatorStyle = .white
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let separatorView: UILabel = {
        let separator = UILabel()
        separator.backgroundColor = .white
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator.heightAnchor.constraint(equalToConstant: 1)
        return separator
    }()
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Dimensionamento de carga"
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let appliancesTitleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Equipamentos"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let appliancesQuantityTitleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Quantidade"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let appliancesPowerTitleLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.text = "Potência"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionStack: UIStackView = {
        let content = UIStackView()
        content.backgroundColor = .black
        content.alignment = .fill
        content.axis = .vertical
        content.spacing = Metrics.Spacing.small
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private let appliancesNameStack: UIStackView = {
        let content = UIStackView()
        content.backgroundColor = .black
        content.alignment = .fill
        content.axis = .vertical
        content.spacing = Metrics.Spacing.tiny
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private let appliancesPowerStack: UIStackView = {
        let content = UIStackView()
        content.backgroundColor = .black
        content.alignment = .fill
        content.axis = .vertical
        content.spacing = Metrics.Spacing.tiny
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private let appliancesQuantityStack: UIStackView = {
        let content = UIStackView()
        content.backgroundColor = .black
        content.alignment = .fill
        content.axis = .vertical
        content.spacing = Metrics.Spacing.tiny
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private let appliancesStack: UIStackView = {
        let content = UIStackView()
        content.backgroundColor = .black
        content.alignment = .fill
        content.axis = .horizontal
        content.spacing = Metrics.Spacing.small
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
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
        backgroundColor = .black
        
        buildViewHierarchy()
        addConstraints()
    }
    
    private func buildViewHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(headerTitleLabel)
        scrollView.addSubview(descriptionStack)
        scrollView.addSubview(separatorView)
        scrollView.addSubview(appliancesStack)
        
        appliancesStack.addArrangedSubview(appliancesNameStack)
        appliancesStack.addArrangedSubview(appliancesPowerStack)
        appliancesStack.addArrangedSubview(appliancesQuantityStack)
        
        appliancesNameStack.addArrangedSubview(appliancesTitleLabel)
        appliancesPowerStack.addArrangedSubview(appliancesPowerTitleLabel)
        appliancesQuantityStack.addArrangedSubview(appliancesQuantityTitleLabel)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            headerTitleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            
            descriptionStack.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: Metrics.Spacing.medium),
            descriptionStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            descriptionStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            
            separatorView.topAnchor.constraint(equalTo: descriptionStack.bottomAnchor, constant: Metrics.Spacing.medium),
            separatorView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            separatorView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            separatorView.heightAnchor.constraint(equalToConstant: 0.3),
            
            appliancesStack.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: Metrics.Spacing.large),
            appliancesStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            appliancesStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            appliancesStack.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -Metrics.Spacing.medium),
        ])
    }
    
    func exportToPDF() -> Data? {
        let pdfRenderer = UIGraphicsPDFRenderer(bounds: bounds)
        
        let pdfData = pdfRenderer.pdfData { context in
            context.beginPage()
            layer.render(in: context.cgContext)
        }
        
        return pdfData
    }
    
    func update(type: String, regionality: String, power: String, appliances: [AppliancesEntity]) {
        let typeLabel = UILabel()
        typeLabel.numberOfLines = 0
        typeLabel.textColor = .white
        typeLabel.font = UIFont.systemFont(ofSize: 14)
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.text = "Tipe de ligação: \(type)"
        
        let regionalityLabel = UILabel()
        regionalityLabel.numberOfLines = 0
        regionalityLabel.textColor = .white
        regionalityLabel.font = UIFont.systemFont(ofSize: 14)
        regionalityLabel.translatesAutoresizingMaskIntoConstraints = false
        regionalityLabel.text = "Regionalidade: \(regionality)"
        
        let totalPowerLabel = UILabel()
        totalPowerLabel.numberOfLines = 0
        totalPowerLabel.textColor = .white
        totalPowerLabel.font = UIFont.systemFont(ofSize: 14)
        totalPowerLabel.translatesAutoresizingMaskIntoConstraints = false
        totalPowerLabel.text = "Potência total: \(power) W"
        
        descriptionStack.addArrangedSubview(typeLabel)
        descriptionStack.addArrangedSubview(regionalityLabel)
        descriptionStack.addArrangedSubview(totalPowerLabel)
                
        appliances.forEach { appliance in
            let applianceNameLabel = UILabel()
            applianceNameLabel.translatesAutoresizingMaskIntoConstraints = false
            applianceNameLabel.text = appliance.appliance
            applianceNameLabel.font = UIFont.systemFont(ofSize: 12)
            applianceNameLabel.textColor = .white
            
            let appliancePowerLabel = UILabel()
            appliancePowerLabel.translatesAutoresizingMaskIntoConstraints = false
            appliancePowerLabel.text = "\(appliance.power) W"
            appliancePowerLabel.font = UIFont.systemFont(ofSize: 12)
            appliancePowerLabel.textColor = .white
            
            let applianceQuantityLabel = UILabel()
            applianceQuantityLabel.translatesAutoresizingMaskIntoConstraints = false
            applianceQuantityLabel.text = appliance.quantity
            applianceQuantityLabel.font = UIFont.systemFont(ofSize: 12)
            applianceQuantityLabel.textColor = .white
            
            appliancesNameStack.addArrangedSubview(applianceNameLabel)
            appliancesPowerStack.addArrangedSubview(appliancePowerLabel)
            appliancesQuantityStack.addArrangedSubview(applianceQuantityLabel)
        }
    }
}

