//
//  BaseFunctions.swift
//  EasyLayout
//
//  Created by Søren Møller Gade Hansen on 16/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

public extension UIView {
    // Turns off translatesAutoresizingMaskIntoConstraints
    @discardableResult
    public func exec() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    // Toggles safe area
    @discardableResult
    public func safe() -> Self {
        safeArea = !self.safeArea
        return self
    }
    
    // MARK: Base functions
    internal func bind(attributes: [Attribute], to view: UIView, attributes viewAttributes: [Attribute], inset: UIEdgeInsets?) {
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
    
    internal func bind(attribute: Attribute, to view: UIView?, attribute attributeView: Attribute, offset: CGFloat) {
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
    
    internal func createLayoutConstraint(attribute: Attribute, to view: UIView?, attribute attributeView: Attribute, value: CGFloat) -> NSLayoutConstraint {
        
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
