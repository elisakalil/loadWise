//
//  RegionalityViewDelegate.swift
//  LoadWise
//
//  Created by Elisa Kalil on 26/06/23.
//

import Foundation

protocol RegionalityViewDelegate: AnyObject {
    func handlerCardSelection(with selectedRegionality: String)
    func buttonAction()
}
