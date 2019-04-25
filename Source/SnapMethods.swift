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
    /**
     
     Fills the view to a given view with an inset.
     
     - returns:
     An UIView object
     
     - parameters:
        - to view: The view it should fill
        - inset: The inset the constraints should be initialized with
    
     */
    @discardableResult
    func snap(to view: UIView, inset: UIEdgeInsets = UIEdgeInsets.zero) -> Self {
        bind(attribute: .left, to: .left, offset: inset.left, view: view)
        bind(attribute: .right, to: .right, offset: -(inset.right), view: view)
        bind(attribute: .bottom, to: .bottom, offset: -(inset.bottom), view: view)
        bind(attribute: .top, to: .top, offset: inset.top, view: view)
        return self
    }
    
    /**
     
     Snaps one attribute to a given view with a given offset.
     
     - returns:
     An UIView object
     
     - parameters:
         - attribute: The attribute of the constrained view
         - toEdge viewAttribute: The attribute of the given view
         - on view: The given view
         - offset: The offset the constraint should be initialized with
     
     */
    @discardableResult
    func snap(attribute: Attribute, toEdge viewAttribute: Attribute, on view: UIView, offset: CGFloat) -> Self {
        bind(attribute: attribute, to: viewAttribute, offset: offset, view: view)
        return self
    }
    
    // MARK: Snap wrapper methods
    /**
     
     Snaps the views left side to a given views left side.
     
     - returns:
     An UIView object
     
     - parameters:
         - view: The view it should snap to
         - offset: The offset the constraint should be initialized with
     
     */
    @discardableResult
    func snapLeft(_ view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .left, to: .left, offset: offset, view: view)
        return self
    }
    
    /**
     
     Snaps the views right side to a given views right side.
     
     - returns:
     An UIView object
     
     - parameters:
         - view: The view it should snap to
         - offset: The offset the constraint should be initialized with
     
     */
    @discardableResult
    func snapRight(_ view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .right, to: .right, offset: offset, view: view)
        return self
    }
    
    /**
     
     Snaps the views top to a given views top.
     
     - returns:
     An UIView object
     
     - parameters:
         - view: The view it should snap to
         - offset: The offset the constraint should be initialized with
     
     */
    @discardableResult
    func snapBottom(_ view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .bottom, to: .bottom, offset: offset, view: view)
        return self
    }
    
    /**
     
     Snaps the views bottom to a given views bottom.
     
     - returns:
     An UIView object
     
     - parameters:
         - view: The view it should snap to
         - offset: The offset the constraint should be initialized with
     
     */
    @discardableResult
    func snapTop(_ view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .top, to: .top, offset: offset, view: view)
        return self
    }
}
