//
//  Attribute.swift
//  SG
//
//  Created by Søren Møller Gade Hansen on 14/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

public extension UIView {
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
            if self == .height || self == .width {
                return true
            }
            return false
        }
    }
}
