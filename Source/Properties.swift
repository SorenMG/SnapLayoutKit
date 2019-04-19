//
//  EasyLayout.swift
//  SG Components
//
//  Created by Søren Møller Gade Hansen on 14/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

public extension UIView {
    // Static safe area property
    private static var _safeArea = false
    
    internal var safeArea: Bool {
        get {
            return UIView._safeArea
        }
        set {
            UIView._safeArea = newValue
        }
    }
    
    // Custom constraints array
    typealias T = [NSLayoutConstraint]
    
    private struct CustomProperties {
        static var snapConstraints = Array<NSLayoutConstraint>()
    }
    
    internal var snapConstraints: [NSLayoutConstraint] {
        get {
            return getAssociatedObject(&CustomProperties.snapConstraints, defaultValue: CustomProperties.snapConstraints)
        }
        set {
            return objc_setAssociatedObject(self, &CustomProperties.snapConstraints, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}
