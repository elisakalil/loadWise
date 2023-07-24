//
//  AppliancesView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

class AppliancesView: UIView {
    
    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.text = .selectYourEquipments
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let controllCenter: ControllCenterProtocol = {
        let card = ControllCenter()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let content = UIView()
        content.backgroundColor = .clear
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
    private lazy var footer: FooterView = {
        let footer = FooterView()
        footer.button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        footer.translatesAutoresizingMaskIntoConstraints = false
        return footer
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = true
        tableView.indicatorStyle = .white
        tableView.rowHeight = 60 + 10
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(AppliancesViewCell.self, forCellReuseIdentifier: "appliancesCell")
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        return tableView
    }()
    
    // MARK: INITIALIZERS
    weak var delegate: AppliancesViewDelegate?
    var dataSource: AppliancesTableViewDataSource
    
    private var items: [AppliancesViewCellEntity] = []
    
    init(dataSource: AppliancesTableViewDataSource) {
        self.dataSource = dataSource
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
        
        setupTable()
        buildViewHierarchy()
        addConstraints()
    }
    
    private func setupTable() {
        let entities = AppliancesStore.appliances.map({dataSource.convertAppliancesModelToEntity(withModel: $0)})
        dataSource.items = entities
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
//        tableView.allowsSelection = false
    }
    
    private func buildViewHierarchy() {
        addSubview(headerTitleLabel)
        addSubview(controllCenter)
        addSubview(scrollView)
        addSubview(contentView)
        addSubview(tableView)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            headerTitleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            headerTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            
            controllCenter.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: Metrics.Spacing.medium),
            controllCenter.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            controllCenter.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            
            scrollView.topAnchor.constraint(equalTo: controllCenter.bottomAnchor, constant: Metrics.Spacing.medium),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            tableView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

//MARK: EquipmentsViewProtocol
extension AppliancesView: AppliancesViewProtocol {
    func updateControllCenter(date: String,
                              local: String,
                              totalPower: String,
                              typeOfConnection: String,
                              regionality: String?)
    {
        controllCenter.updateControllCenter(date: date,
                                            local: local,
                                            totalPower: totalPower,
                                            typeOfConnection: typeOfConnection,
                                            regionality: regionality)
    }
}

//MARK: FooterViewDelegate
extension AppliancesView: FooterViewDelegate { }
