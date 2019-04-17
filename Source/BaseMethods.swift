//
//  BaseFunctions.swift
//  EasyLayout
//
//  Created by Søren Møller Gade Hansen on 16/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

/*
 
 Switch from being based upon NSLayoutConstraint to be based upon anchors.
 
 */

import UIKit

public extension UIView {
    // Turns off translatesAutoresizingMaskIntoConstraints
    @discardableResult
    public func exec() -> Self {
        self.translatesAutoresizingMaskIntoConstraints = false
        safeArea = false
        return self
    }
    
    // Toggles safe area
    @discardableResult
    public func safe() -> Self {
        safeArea = !self.safeArea
        return self
    }
    
    // MARK: Base functions
    private func createXAxisLayoutConstraint(anchor: NSLayoutXAxisAnchor, equalTo viewAnchor: NSLayoutXAxisAnchor, offset: CGFloat) -> NSLayoutConstraint {
        return anchor.constraint(equalTo: viewAnchor, constant: offset)
    }
    
    private func createYAxisLayoutConstraint(anchor: NSLayoutYAxisAnchor, equalTo viewAnchor: NSLayoutYAxisAnchor, offset: CGFloat) -> NSLayoutConstraint {
        return anchor.constraint(equalTo: viewAnchor, constant: offset)
    }
    
    private func createDimensionLayoutConstraint(anchor: NSLayoutDimension, equalTo _viewAnchor: NSLayoutDimension?, value: CGFloat) -> NSLayoutConstraint {
        if let viewAnchor = _viewAnchor {
            return anchor.constraint(equalTo: viewAnchor)
        }
        return anchor.constraint(equalToConstant: value)
    }
    
    private func bindXAxis(anchor: NSLayoutXAxisAnchor, equalTo viewAnchor: NSLayoutXAxisAnchor, offset: CGFloat, view: UIView) {
        
        var safetyAnchor: NSLayoutXAxisAnchor = viewAnchor
        
        if safeArea {
            if let name = safetyAnchor.value(forKey: "name") as? String {
                if name == "leading" {
                    if #available(iOS 11.0, *) {
                        safetyAnchor = view.safeAreaLayoutGuide.leadingAnchor
                    }
                }
                else if name == "trailing" {
                    if #available(iOS 11.0, *) {
                        safetyAnchor = view.safeAreaLayoutGuide.trailingAnchor
                    }
                }
            }
        }
        
        createXAxisLayoutConstraint(anchor: anchor, equalTo: safetyAnchor, offset: offset).isActive = true
    }
    
    private func bindYAxis(anchor: NSLayoutYAxisAnchor, equalTo viewAnchor: NSLayoutYAxisAnchor, offset: CGFloat, view: UIView) {
        
        var safetyAnchor: NSLayoutYAxisAnchor = viewAnchor
        
        if safeArea {
            if let name = safetyAnchor.value(forKey: "name") as? String {
                if name == "top" {
                    if #available(iOS 11.0, *) {
                        safetyAnchor = view.safeAreaLayoutGuide.topAnchor
                    }
                }
                else if name == "bottom" {
                    if #available(iOS 11.0, *) {
                        safetyAnchor = view.safeAreaLayoutGuide.bottomAnchor
                    }
                }
            }
        }
        
        createYAxisLayoutConstraint(anchor: anchor, equalTo: safetyAnchor, offset: offset).isActive = true
    }
    
    private func bindDimension(anchor: NSLayoutDimension, equalTo viewAnchor: NSLayoutDimension?, value: CGFloat) {
        createDimensionLayoutConstraint(anchor: anchor, equalTo: viewAnchor, value: value).isActive = true
    }
    
    internal func bind(attribute: Attribute, to viewAttribute: Attribute, offset: CGFloat, view: UIView) {
        // As anchors are static, only check when developing
//        #if DEBUG
//        print(attribute.isXAxis(), viewAttribute.isXAxis(), " | ", attribute.isYAxis(), viewAttribute.isYAxis(), " | ", attribute.isDimension(), viewAttribute.isDimension())
//
//            if attribute.isXAxis() != viewAttribute.isXAxis() || attribute.isYAxis() != viewAttribute.isYAxis() || attribute.isDimension() != viewAttribute.isDimension() {
//                fatalError("Cannot bind different typed anchors")
//            }
//        #endif
        
        switch attribute {
        case .width:
            if viewAttribute == .height {
                bindDimension(anchor: self.widthAnchor, equalTo: view.heightAnchor, value: offset)
            }
            else if viewAttribute == .width {
                bindDimension(anchor: self.widthAnchor, equalTo: view.widthAnchor, value: offset)
            }
            else {
                bindDimension(anchor: self.widthAnchor, equalTo: nil, value: offset)
            }
        case .height:
            if viewAttribute == .height {
                bindDimension(anchor: self.heightAnchor, equalTo: view.heightAnchor, value: offset)
            }
            else if viewAttribute == .width {
                bindDimension(anchor: self.heightAnchor, equalTo: view.widthAnchor, value: offset)
            }
            else {
                bindDimension(anchor: self.heightAnchor, equalTo: nil, value: offset)
            }
        case .left:
            if viewAttribute == .right {
                bindXAxis(anchor: self.leadingAnchor, equalTo: view.trailingAnchor, offset: offset, view: view)
            } else {
                bindXAxis(anchor: self.leadingAnchor, equalTo: view.leadingAnchor, offset: offset, view: view)
            }
        case .right:
            if viewAttribute == .right {
                bindXAxis(anchor: self.trailingAnchor, equalTo: view.trailingAnchor, offset: offset, view: view)
            } else {
                bindXAxis(anchor: self.trailingAnchor, equalTo: view.leadingAnchor, offset: offset, view: view)
            }
        case .top:
            if viewAttribute == .top {
                bindYAxis(anchor: self.topAnchor, equalTo: view.topAnchor, offset: offset, view: view)
            } else {
                bindYAxis(anchor: self.topAnchor, equalTo: view.bottomAnchor, offset: offset, view: view)
            }
        case .bottom:
            if viewAttribute == .top {
                bindYAxis(anchor: self.bottomAnchor, equalTo: view.topAnchor, offset: offset, view: view)
            } else {
                bindYAxis(anchor: self.bottomAnchor, equalTo: view.bottomAnchor, offset: offset, view: view)
            }
        case .centerX:
            if viewAttribute == .left {
                bindXAxis(anchor: self.centerXAnchor, equalTo: view.leadingAnchor, offset: offset, view: view)
            }
            else if viewAttribute == .right {
                bindXAxis(anchor: self.centerXAnchor, equalTo: view.trailingAnchor, offset: offset, view: view)
            }
            else {
                bindXAxis(anchor: self.centerXAnchor, equalTo: view.centerXAnchor, offset: offset, view: view)
            }
        case .centerY:
            if viewAttribute == .top {
                bindYAxis(anchor: self.centerYAnchor, equalTo: view.topAnchor, offset: offset, view: view)
            }
            else if viewAttribute == .bottom {
                bindYAxis(anchor: self.centerYAnchor, equalTo: view.bottomAnchor, offset: offset, view: view)
            }
            else {
                bindYAxis(anchor: self.centerYAnchor, equalTo: view.centerYAnchor, offset: offset, view: view)
            }
        case .none:
            assert(false, "Cannot bind an undefined anchor")
        }
    }
}
