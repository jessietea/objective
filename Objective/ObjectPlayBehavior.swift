//
//  ObjectPlayBehavior.swift
//  Objective
//
//  Created by Jessie Alvarez on 3/10/15.
//  Copyright (c) 2015 Jessie Alvarez. All rights reserved.
//

import UIKit

class ObjectPlayBehavior: UIDynamicBehavior {
    
    let gravity = UIGravityBehavior()
        
    lazy var collider: UICollisionBehavior = {
        let lazilyCreatedCollider = UICollisionBehavior()
        lazilyCreatedCollider.translatesReferenceBoundsIntoBoundary = true
        return lazilyCreatedCollider
    }()
    
    lazy var objectBehavior: UIDynamicItemBehavior = {
        let lazilyCreatedObjectBehavior = UIDynamicItemBehavior()
        lazilyCreatedObjectBehavior.allowsRotation = true
        lazilyCreatedObjectBehavior.elasticity = 0
        return lazilyCreatedObjectBehavior
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(objectBehavior)
//        collider.action = {
//            [unowned self] Void in
//            if let refView = self.dynamicAnimator?.referenceView? {
//                for viewObject in refView.subviews {
//                    if let view = viewObject as? UIImageView {
////                        if (!CGRectContainsRect(refView.bounds, view.frame)) {
////                            let size = view.bounds.size
////                            view.frame.origin = CGPoint(x: refView.bounds.midX, y: 2)
////                            view.bounds.size = size
////                        }
//                        if view.frame.minX < 0 || view.frame.minY < 0
//                            || view.frame.maxX > refView.bounds.maxX || view.frame.maxY > refView.bounds.maxY
//                            || view.frame.minY > refView.bounds.maxY {
//                                let size = view.bounds.size
//                                view.frame.origin = CGPoint(x: refView.bounds.midX, y: 2)
//                                view.bounds.size = size
//                        }
//                    }
//                }
//            }
//        }
    }
    
    func addBarrier(path: UIBezierPath, named name: String) {
        collider.removeBoundaryWithIdentifier(name)
        collider.addBoundaryWithIdentifier(name, forPath: path)
    }
    
    func addObject(objectToAdd: UIImageView) {
        dynamicAnimator?.referenceView?.addSubview(objectToAdd)
        gravity.addItem(objectToAdd)
        collider.addItem(objectToAdd)
        objectBehavior.addItem(objectToAdd)
    }

}
