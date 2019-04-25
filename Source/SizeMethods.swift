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
    @discardableResult
    func size(as view: UIView) -> Self {
        bind(attribute: .width, to: .none, offset: view.frame.size.width, view: UIView())
        bind(attribute: .height, to: .none, offset: view.frame.size.height, view: UIView())
        return self
    }

    // Set custom size of view
    @discardableResult
    func size(_ size: CGSize) -> Self {
        if (size.width != 0) {
            bind(attribute: .width, to: .none, offset: size.width, view: UIView())
        }
        if (size.height != 0) {
            bind(attribute: .height, to: .none, offset: size.height, view: UIView())
        }
        return self
    }
}
