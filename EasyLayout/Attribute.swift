//
//  Attribute.swift
//  SG
//
//  Created by Søren Møller Gade Hansen on 14/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

extension UIView {
    enum Attribute {
        case width
        case height
        case left
        case right
        case top
        case bottom
        case centerX
        case centerY
        case none
        
        func attribute() -> NSLayoutConstraint.Attribute {
            switch self {
            case .left:
                return NSLayoutConstraint.Attribute.left
            case .right:
                return NSLayoutConstraint.Attribute.right
            case .top:
                return NSLayoutConstraint.Attribute.top
            case .bottom:
                return NSLayoutConstraint.Attribute.bottom
            case .width:
                return NSLayoutConstraint.Attribute.width
            case .height:
                return NSLayoutConstraint.Attribute.height
            case .none:
                return NSLayoutConstraint.Attribute.notAnAttribute
            case .centerX:
                return NSLayoutConstraint.Attribute.centerX
            case .centerY:
                return NSLayoutConstraint.Attribute.centerY
            }
        }
        
        func safe() -> NSLayoutConstraint.Attribute {
            let attribute = self.attribute()
            switch attribute {
//            case .left:
//                return NSLayoutConstraint.Attribute.leftMargin
//            case .right:
//                return NSLayoutConstraint.Attribute.rightMargin
            case .top:
                return NSLayoutConstraint.Attribute.topMargin
            case .bottom:
                return NSLayoutConstraint.Attribute.bottomMargin
            default:
                return attribute
            }
        }
        
        func isDimension() -> Bool {
            if (self == .width || self == .height) {
                return true
            }
            return false
        }
        
        func isEdge() -> Bool {
            if (self == .bottom || self == .top || self == .left || self == .right) {
                return true
            }
            return false
        }
    }
}
