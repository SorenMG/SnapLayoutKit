//
//  UpdateMethods.swift
//  SnapLayoutKit
//
//  Created by Søren Møller Gade Hansen on 18/04/2019.
//  Copyright © 2019 Søren Møller Gade Hansen. All rights reserved.
//

import UIKit

extension UIView {

    /**
     
     Binds an existing constraint to another attribute on another view.
     
     - returns:
     An UIView object
     
     - parameters:
         - constraint attribute: The existing constraint attribute
         - toConstraint attribute: The attribute the constraint should be bound to
         - on view: The given view the constraint should be bound to
         - offset: The offset the constraint should be initialized with
    */
    @discardableResult
    public func update(constraint constraintAttribute: Attribute, toConstraint updateAttribute: Attribute, on view: UIView, offset: CGFloat) -> Self {
        for constraint in snapConstraints {
            if constraint.firstAttribute == constraintAttribute.getAttribute() {
                // Remove constraint
                if !deleteConstraint(constraint) {
                    assert(false, "Could not locate constraint")
                    return self
                }
                
                // Bind new constraint
                bind(attribute: constraintAttribute, to: updateAttribute, offset: offset, view: view)
            }
        }
        return self
    }
    
    /**
     
     Deletes an existing constraint from the view
     
     - returns:
     An UIView object
     
     - parameters:
        - attribute: The given constraint attribute to delete from the view
     */
    @discardableResult
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
        return self
    }
}
