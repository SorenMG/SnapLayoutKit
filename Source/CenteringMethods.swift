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
    /**
     
     Centers the view's X-axis and Y-axis to a given view.
     
     - returns:
     An UIView object
     
     - parameters:
        - to view: The view it should be centered to
     
    */
    @discardableResult
    func center(to view: UIView) -> Self {
        bind(attribute: .centerX, to: .centerX, offset: 0, view: view)
        bind(attribute: .centerY, to: .centerY, offset: 0, view: view)
        return self
    }
    
    /**
     
     Centers the view's X-axis to a given view.
     
     - returns:
     An UIView object
     
     - parameters:
        - to view: The view it should be centered to
     
     */
    @discardableResult
    func centerX(to view: UIView) -> Self {
        bind(attribute: .centerX, to: .centerX, offset: 0, view: view)
        return self
    }
    
    /**
     
     Centers the view's Y-axis to a given view.
     
     - returns:
     An UIView object
     
     - parameters:
        - to view: The view it should be centered to
     
     */
    @discardableResult
    func centerY(to view: UIView) -> Self {
        bind(attribute: .centerY, to: .centerY, offset: 0, view: view)
        return self
    }
}
