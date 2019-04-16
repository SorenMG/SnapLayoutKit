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
        bind(attributes: [.bottom, .top, .left, .right], to: view, attributes: [.bottom, .top, .left, .right], inset: inset)
        return self
    }
    
    // Snaps one side to a view
    @discardableResult
    public func snap(edge: Attribute, toEdge viewEdge: Attribute, on view: UIView, offset: CGFloat) -> Self {
        bind(attribute: edge, to: view, attribute: viewEdge, offset: offset)
        return self
    }
    
    // MARK: Snap wrapper methods
    @discardableResult
    public func snapLeft(to view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .left, to: view, attribute: .left, offset: offset)
        return self
    }
    
    @discardableResult
    public func snapRight(to view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .right, to: view, attribute: .right, offset: offset)
        return self
    }
    
    @discardableResult
    func snapTop(to view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .top, to: view, attribute: .top, offset: offset)
        return self
    }
    
    @discardableResult
    public func snapBottom(to view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .bottom, to: view, attribute: .bottom, offset: offset)
        return self
    }
}
