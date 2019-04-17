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
    // Centers view to view
    @discardableResult
    public func center(to view: UIView) -> Self {
        bind(attribute: .centerX, to: .centerX, offset: 0, view: view)
        bind(attribute: .centerY, to: .centerY, offset: 0, view: view)
        return self
    }
    
    // Centers view X axis to view
    @discardableResult
    public func centerX(to view: UIView) -> Self {
        bind(attribute: .centerX, to: .centerX, offset: 0, view: view)
        return self
    }
    
    @discardableResult
    public func centerY(to view: UIView) -> Self {
        bind(attribute: .centerY, to: .centerY, offset: 0, view: view)
        return self
    }
}
