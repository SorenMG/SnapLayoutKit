//
//  Attribute.swift
//  SG
//
//  Created by Søren Møller Gade Hansen on 14/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

public extension UIView {
    enum Attribute: String {
        case width = "width"
        case height = "height"
        case left = "leading"
        case right = "trailing"
        case top = "top"
        case bottom = "bottom"
        case centerX = "centerX"
        case centerY = "centerY"
        case none

        func isXAxis() -> Bool {
            if self == .left || self == .right || self == .centerX {
                return true
            }
            return false
        }
        
        func isYAxis() -> Bool {
            if self == .top || self == .bottom || self == .centerY {
                return true
            }
            return false
        }
        
        func isDimension() -> Bool {
            if self == .height || self == .width || self == .none {
                return true
            }
            return false
        }
        
        func getAttribute() -> NSLayoutConstraint.Attribute {
            switch self {
            case .width:
                return NSLayoutConstraint.Attribute.width
            case .height:
                return NSLayoutConstraint.Attribute.height
            case .left:
                return NSLayoutConstraint.Attribute.leading
            case .right:
                return NSLayoutConstraint.Attribute.trailing
            case .top:
                return NSLayoutConstraint.Attribute.top
            case .bottom:
                return NSLayoutConstraint.Attribute.bottom
            case .centerX:
                return NSLayoutConstraint.Attribute.centerX
            case .centerY:
                return NSLayoutConstraint.Attribute.centerY
            case .none:
                return NSLayoutConstraint.Attribute.notAnAttribute
            }
        }
    }
}
