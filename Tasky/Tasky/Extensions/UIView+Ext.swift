//
//  UIView+Ext.swift
//  Tasky
//
//  Created by Utku Çetinkaya on 4.10.2023.
//

import UIKit

extension UIView {
    
    // MARK: - Properties
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
