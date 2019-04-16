//
//  CenteringMethods.swift
//  EasyLayout
//
//  Created by Søren Møller Gade Hansen on 16/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

public extension UIView {
    // MARK: Centering wrapper methods
    @discardableResult
    public func center(to view: UIView) -> Self {
        bind(attribute: .centerX, to: view, attribute: .centerX, offset: 0)
        bind(attribute: .centerY, to: view, attribute: .centerY, offset: 0)
        return self
    }
    
    @discardableResult
    public func centerX(to view: UIView) -> Self {
        bind(attribute: .centerX, to: view, attribute: .centerX, offset: 0)
        return self
    }
    
    @discardableResult
    public func centerY(to view: UIView) -> Self {
        bind(attribute: .centerY, to: view, attribute: .centerY, offset: 0)
        return self
    }
}
