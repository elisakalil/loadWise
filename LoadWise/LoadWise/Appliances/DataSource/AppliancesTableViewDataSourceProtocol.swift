//
//  AppliancesTableViewDataSourceProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 16/07/23.
//

import UIKit

protocol AppliancesTableViewDataSourceProtocol: UITableViewDataSource, UITableViewDelegate {
    var items: [AppliancesViewCellEntity] { get set }
    
    func convertAppliancesModelToEntity(withModel model: AppliancesModel) -> AppliancesViewCellEntity
}
