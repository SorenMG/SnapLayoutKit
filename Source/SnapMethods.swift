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
    @discardableResult
    public func snap(to view: UIView, inset: UIEdgeInsets = UIEdgeInsets.zero) -> Self {
        bind(attribute: .left, to: .left, offset: inset.left, view: view)
        bind(attribute: .right, to: .right, offset: -(inset.right), view: view)
        bind(attribute: .bottom, to: .bottom, offset: -(inset.bottom), view: view)
        bind(attribute: .top, to: .top, offset: inset.top, view: view)
        return self
    }
    
    // Snaps one attribute
    @discardableResult
    public func snap(attribute: Attribute, toEdge viewAttribute: Attribute, on view: UIView, offset: CGFloat) -> Self {
        bind(attribute: attribute, to: viewAttribute, offset: offset, view: view)
        return self
    }
    
    // MARK: Snap wrapper methods
    @discardableResult
    public func snapLeft(_ view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .left, to: .left, offset: offset, view: view)
        return self
    }
    
    @discardableResult
    public func snapRight(_ view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .right, to: .right, offset: offset, view: view)
        return self
    }
    
    @discardableResult
    public func snapBottom(_ view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .bottom, to: .bottom, offset: offset, view: view)
        return self
    }
    
    @discardableResult
    public func snapTop(_ view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .top, to: .top, offset: offset, view: view)
        return self
    }
}
