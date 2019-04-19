//
//  UpdateMethods.swift
//  SnapLayoutKit
//
//  Created by Søren Møller Gade Hansen on 18/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

extension UIView {

    @discardableResult
    public func update(constraint constraintAttribute: Attribute, toConstraint updateAttribute: Attribute, on view: UIView, offset: CGFloat) -> Self {
        
//        if constraintAttribute.isDimension() && updateAttribute != .none {
//            assert(false, "When updating with, the second attribute should be .none")
//            return self
//        }

        for constraint in snapConstraints {
            if constraint.firstAttribute == constraintAttribute.getAttribute() {
                if updateAttribute.getAttribute() == constraint.secondAttribute {
                    // Anchor already exists.
                    // Alter the offset
                    constraint.constant = offset
                    return self
                }
                // Needs new constraint
                if !deleteConstraint(constraint) {
                    assert(false, "Could not locate constraint")
                    return self
                }
                
                bind(attribute: constraintAttribute, to: updateAttribute, offset: offset, view: view)
            }
        }
        
        return self
    }
    
    public func delete(_ attribute: Attribute) -> Self {
        for constraint in snapConstraints {
            if constraint.firstAttribute == attribute.getAttribute() {
                if !deleteConstraint(constraint) {
                    assert(false, "Could not delete constraint: Constraint not found")
                }
                return self
            }
        }
        assert(false, "Could not delete constraint: No constraint with that attribute")
    }
}
