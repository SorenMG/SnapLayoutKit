//
//  SizeMethods.swift
//  EasyLayout
//
//  Created by Søren Møller Gade Hansen on 16/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

public extension UIView {
    // MARK: Size methods
    // Set size of view as the given view
//    @discardableResult
//    public func size(as view: UIView) -> Self {
//        bind(attribute: .width, to: nil, attribute: .none, offset: view.frame.width)
//        bind(attribute: .height, to: nil, attribute: .none, offset: view.frame.height)
//        return self
//    }
//    
//    // Set custom size of view
//    @discardableResult
//    func size(_ size: CGSize) -> Self {
//        if (size.width != 0) {
//            bind(attribute: .width, to: nil, attribute: .none, offset: size.width)
//        }
//        if (size.height != 0) {
//            bind(attribute: .height, to: nil, attribute: .none, offset: size.height)
//        }
//        return self
//    }
    
    public func size(_ size: CGSize) -> Self {
        bind(attribute: .width, to: .none, offset: size.width, view: UIView())
        bind(attribute: .height, to: .none, offset: size.height, view: UIView())
        return self
    }
}
