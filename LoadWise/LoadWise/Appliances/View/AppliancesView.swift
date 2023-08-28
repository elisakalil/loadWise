//
//  AppliancesView.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation
import UIKit

class AppliancesView: UIView {
    
    private let controllCenter: ControllCenterProtocol = {
        let card = ControllCenter()
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.indicatorStyle = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let containerView: UIView = {
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
        tableView.showsVerticalScrollIndicator = false
        tableView.register(AppliancesViewCell.self, forCellReuseIdentifier: "appliancesCell")
        tableView.translatesAutoresizingMaskIntoConstraints  = false
        return tableView
    }()
    
    // MARK: Public Initializers
    weak var delegate: AppliancesViewDelegate?
    var previousDataModel: AppliancesViewCellEntity?
    var dataSource: AppliancesTableViewDataSource
    
    // MARK: Private Initializers
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
    
    // MARK: Private Functions
    private func setup() {
        backgroundColor = .black
        footer.updateButton(with: .proceed)
        
        setupTable()
        buildViewHierarchy()
        addConstraints()
    }
    
    private func setupTable() {
        let entities = AppliancesStore.appliances.map({dataSource.convertAppliancesModelToEntity(withModel: $0)})
        items = entities
        
        dataSource.items = entities
        dataSource.dataSourceDelegate = self
        
        tableView.dataSource = dataSource
        tableView.delegate = dataSource
        
        tableView.reloadData()
    }
    
    private func buildViewHierarchy() {
        addSubview(scrollView)
        addSubview(footer)

        scrollView.addSubview(containerView)
        
        containerView.addSubview(controllCenter)
        containerView.addSubview(tableView)
    }

    private func addConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: footer.topAnchor),
            
            containerView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            controllCenter.topAnchor.constraint(equalTo: containerView.topAnchor, constant: Metrics.Spacing.small),
            controllCenter.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            controllCenter.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            tableView.topAnchor.constraint(equalTo: controllCenter.bottomAnchor, constant: Metrics.Spacing.medium),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            footer.topAnchor.constraint(equalTo: containerView.bottomAnchor),
            footer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Metrics.Spacing.medium),
            footer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Metrics.Spacing.medium),
            footer.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
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
                                            totalPower: "\(totalPower)",
                                            typeOfConnection: typeOfConnection,
                                            regionality: regionality)
    }
}

//MARK: FooterViewDelegate
extension AppliancesView: FooterViewDelegate { }

//MARK: AppliancesTableViewDataSourceDelegate
extension AppliancesView: AppliancesTableViewDataSourceDelegate {
    func increaseButtonTapped(for dataModel: AppliancesViewCellEntity) {
        if let index = dataSource.items.firstIndex(where: { $0 === dataModel }) {
            dataSource.items[index].quantity += 1
            
            let indexPath = IndexPath(row: index, section: 0)
            tableView.reloadRows(at: [indexPath], with: .none)
            delegate?.calculateTotalPower(items: items)
            delegate?.updateItems(items: items)
        }
    }
    
    func decreaseButtonTapped(for dataModel: AppliancesViewCellEntity) {
        if let index = dataSource.items.firstIndex(where: { $0 === dataModel }) {
            if dataSource.items[index].quantity > 0 {
                dataSource.items[index].quantity -= 1
                
                let indexPath = IndexPath(row: index, section: 0)
                tableView.reloadRows(at: [indexPath], with: .none)
                
                delegate?.calculateTotalPower(items: items)
                delegate?.updateItems(items: items)
            }
        }
    }
}
