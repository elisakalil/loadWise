//
//  PDFExporterViewProtocol.swift
//  LoadWise
//
//  Created by Elisa Kalil on 27/08/23.
//

import UIKit

protocol PDFExporterViewProtocol where Self: UIView {
    func exportToPDF() -> Data?
    func update(type: String,
                regionality: String,
                power: String,
                appliances: [AppliancesEntity])
}
