//
//  ResultsViewModel.swift
//  LoadWise
//
//  Created by Elisa Kalil on 30/07/23.
//

import Foundation
import UIKit

class ResultsViewModel { }

// MARK: EquipmentsViewModelProtocol
extension ResultsViewModel: ResultsViewModelProtocol {
    func getTitle(with totalPower: Int) -> String {
        return "Você precisará de \(totalPower) Watts de energia."
    }
    
    func getType(with totalPower: Int) -> String {
        if totalPower <= 15000 {
            return "Monofásico"
        } else if totalPower <= 25000 {
            return "Bifásico"
        } else {
            return "Trifásico"
        }
    }
    
    func getDescription(with totalPower: Int) -> String {
        if totalPower == 15000 || totalPower == 25000 || totalPower == 75000 {
            return .reachLimit
        } else if totalPower < 15000 {
            let missingPower = 15000 - totalPower

            return "Para ligações do tipo monofásica, é possível solicitar até 15 kW sem custos adicionais. Caso queira, volte e adicione mais \(missingPower) Watts em equipamentos à sua lista."
        } else if totalPower < 25000 {
            let missingPower = 25000 - totalPower

            return "Para ligações do tipo bifásica, é possível solicitar até 25 kW sem custos adicionais. Caso queira, volte e adicione mais \(missingPower) Watts em equipamentos à sua lista."
        } else if totalPower < 65000 {
            let missingPower = 75000 - totalPower

            return "Para ligações do tipo trifásica, é possível solicitar até 75 kW sem custos adicionais. Caso queira, volte e adicione mais \(missingPower) Watts em equipamentos à sua lista."
        } else {
            return "Atenção, deverá ser justificada a necessidade por meio do cálculo da demanda e documento de responsabilidade técnica por profissional habilitado via sistema PEP."
        }
    }
}
