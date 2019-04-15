//
//  EasyLayout.swift
//  SG Components
//
//  Created by Søren Møller Gade Hansen on 14/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

extension UIView {
    private static var _safeArea = false
    
    private var safeArea: Bool {
        get {
            return UIView._safeArea
        }
        set {
            UIView._safeArea = newValue
        }
    }
    
    private var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
    
    // Turns off translatesAutoresizingMaskIntoConstraints
    @discardableResult
    func exec() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    @discardableResult
    func safe() -> Self {
        safeArea = !self.safeArea
        return self
    }
    
    // MARK: Snap wrapper methods
    @discardableResult
    func snapLeft(to view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .left, to: view, attribute: .left, offset: offset)
        return self
    }
    
    @discardableResult
    func snapRight(to view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .right, to: view, attribute: .right, offset: offset)
        return self
    }
    
    @discardableResult
    func snapTop(to view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .top, to: view, attribute: .top, offset: offset)
        return self
    }
    
    @discardableResult
    func snapBottom(to view: UIView, offset: CGFloat) -> Self {
        bind(attribute: .bottom, to: view, attribute: .bottom, offset: offset)
        return self
    }
    
    // MARK: Centering wrapper methods
    @discardableResult
    func center(to view: UIView) -> Self {
        bind(attribute: .centerX, to: view, attribute: .centerX, offset: 0)
        bind(attribute: .centerY, to: view, attribute: .centerY, offset: 0)
        return self
    }
    
    @discardableResult
    func centerX(to view: UIView) -> Self {
        bind(attribute: .centerX, to: view, attribute: .centerX, offset: 0)
        return self
    }
    
    @discardableResult
    func centerY(to view: UIView) -> Self {
        bind(attribute: .centerY, to: view, attribute: .centerY, offset: 0)
        return self
    }
    
    // MARK: Snap methods
    // Fills view to superview
    @discardableResult
    func snap(to view: UIView, inset: UIEdgeInsets = UIEdgeInsets.zero) -> Self {
        bind(attributes: [.bottom, .top, .left, .right], to: view, attributes: [.bottom, .top, .left, .right], inset: inset)
        return self
    }
    
    // Snaps one side to a view
    @discardableResult
    func snap(edge: Attribute, toEdge viewEdge: Attribute, on view: UIView, offset: CGFloat) -> Self {
        bind(attribute: edge, to: view, attribute: viewEdge, offset: offset)
        return self
    }
    
    // MARK: Size methods
    // Set size of view as the given view
    @discardableResult
    func size(as view: UIView) -> Self {
        bind(attribute: .width, to: nil, attribute: .none, offset: view.frame.width)
        bind(attribute: .height, to: nil, attribute: .none, offset: view.frame.height)
        return self
    }
    
    // Set custom size of view
    @discardableResult
    func size(_ size: CGSize) -> Self {
        if (size.width != 0) {
            bind(attribute: .width, to: nil, attribute: .none, offset: size.width)
        }
        if (size.height != 0) {
            bind(attribute: .height, to: nil, attribute: .none, offset: size.height)
        }
        return self
    }
    
    // MARK: Base functions
    private func bind(attributes: [Attribute], to view: UIView, attributes viewAttributes: [Attribute], inset: UIEdgeInsets?) {
        for (index, attribute) in attributes.enumerated() {
            var offset: CGFloat!
            switch attribute {
            case .left:
                offset = inset?.left ?? 0
            case .right:
                offset = inset?.right ?? 0
                offset.negate()
            case .top:
                offset = inset?.top ?? 0
            case .bottom:
                offset = inset?.bottom ?? 0
                offset.negate()
            case .height:
                #if DEBUG
                fatalError("Cannot bind dimensions with this method yet.")
                #endif
                break
            default:
                break
            }
            bind(attribute: attribute, to: view, attribute: viewAttributes[index], offset: offset)
        }
    }
    
    private func bind(attribute: Attribute, to view: UIView?, attribute attributeView: Attribute, offset: CGFloat) {
        #if DEBUG
        // Is view declared while trying to set a dimension
        if (attribute.isDimension() && view != nil) {
            fatalError("Cannot bind dimensions to a view")
        }
        
        if (attribute.isDimension() && attributeView != .none) {
            fatalError("Cannot bind dimension to an edge or a dimension")
        }
        #endif
        
        createLayoutConstraint(attribute: attribute, to: view, attribute: attributeView, value: offset).isActive = true
    }
    
    private func createLayoutConstraint(attribute: Attribute, to view: UIView?, attribute attributeView: Attribute, value: CGFloat) -> NSLayoutConstraint {
        
        var targetAttribute: NSLayoutConstraint.Attribute = attributeView.attribute()
        
        if safeArea {
            if let parentVC = parentViewController {
                if parentVC.view == view {
                    if attributeView.isEdge() {
                        targetAttribute = attributeView.safe()
                    }
                }
            }
        }
        
        return NSLayoutConstraint(item: self, attribute: attribute.attribute(), relatedBy: .equal, toItem: view, attribute: targetAttribute, multiplier: 1.0, constant: value)
    }
}
