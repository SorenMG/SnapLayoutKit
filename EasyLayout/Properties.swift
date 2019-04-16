//
//  EasyLayout.swift
//  SG Components
//
//  Created by Søren Møller Gade Hansen on 14/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

public extension UIView {
    private static var _safeArea = false
    
    internal var safeArea: Bool {
        get {
            return UIView._safeArea
        }
        set {
            UIView._safeArea = newValue
        }
    }
    
    internal var parentViewController: UIViewController? {
        get {
            var parentResponder: UIResponder? = self
            while parentResponder != nil {
                parentResponder = parentResponder!.next
                if let viewController = parentResponder as? UIViewController {
                    return viewController
                }
            }
            return nil
        }
    }
}
