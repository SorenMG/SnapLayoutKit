//
//  SnapMethods.swift
//  EasyLayout
//
//  Created by Søren Møller Gade Hansen on 16/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

public extension UIView {
    // MARK: Snap methods
    // Fills view to superview
    public func snap(attri: Attribute, toEdge viewAttri: Attribute, on view: UIView, offset: CGFloat) -> Self {
        bind(attribute: attri, to: viewAttri, offset: offset, view: view)
        return self
    }
    
    // MARK: Snap wrapper methods
    @discardableResult
    public func snapLeft(_ view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .left, to: .left, offset: offset, view: view)
        return self
    }
    
}
