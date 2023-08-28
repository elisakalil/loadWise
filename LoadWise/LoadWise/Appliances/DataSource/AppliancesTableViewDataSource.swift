//
//  AppliancesTableViewDataSource.swift
//  LoadWise
//
//  Created by Elisa Kalil on 16/07/23.
//

import UIKit

protocol AppliancesTableViewDataSourceDelegate: AnyObject {
    func increaseButtonTapped(for dataModel: AppliancesViewCellEntity)
    func decreaseButtonTapped(for dataModel: AppliancesViewCellEntity)
}

final class AppliancesTableViewDataSource: NSObject, AppliancesTableViewDataSourceProtocol {
    public var items: [AppliancesViewCellEntity] = []
    weak var dataSourceDelegate: AppliancesTableViewDataSourceDelegate?
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "appliancesCell", for: indexPath) as! AppliancesViewCell
        let item = items[indexPath.row]
                
        cell.selectionStyle = .none
        cell.dataSourceDelegate = dataSourceDelegate
        cell.setDataCell(withData: item)
        cell.isUserInteractionEnabled = true
        return cell
    }
    
    func convertAppliancesModelToEntity(withModel model: AppliancesModel) -> AppliancesViewCellEntity {
        return AppliancesViewCellEntity(title: model.name, power: model.power, icon: model.icon, quantity: model.quantity)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .black

        let label = UILabel()
        label.textAlignment = .left
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = .selectYourEquipments
        label.translatesAutoresizingMaskIntoConstraints = false

        headerView.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: headerView.topAnchor),
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -16)
        ])

        return headerView
    }
}



