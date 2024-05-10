//
//  UIView+Extension.swift
//  CarrotMarket
//
//  Created by 김서윤 on 5/10/24.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
