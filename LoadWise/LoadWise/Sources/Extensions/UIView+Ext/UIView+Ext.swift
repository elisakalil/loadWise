//
//  UIViewExtension.swift
//  LoadWise
//
//  Created by Elisa Kalil on 15/07/23.
//

import UIKit

extension UIView {
    public var safeArea: UILayoutGuide {
        return safeAreaLayoutGuide
    }
    
    public func bindFrameToSuperviewBounds(constant: CGFloat = 0) {
        guard let superview = self.superview else { return }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: superview.safeArea.topAnchor, constant: constant).isActive = true
        self.bottomAnchor.constraint(equalTo: superview.safeArea.bottomAnchor, constant: -constant).isActive = true
        self.leadingAnchor.constraint(equalTo: superview.safeArea.leadingAnchor, constant: constant).isActive = true
        self.trailingAnchor.constraint(equalTo: superview.safeArea.trailingAnchor, constant: -constant).isActive = true
    }
}
