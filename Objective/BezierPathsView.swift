//
//  BezierPathsView.swift
//  Objective
//
//  Created by Jessie Alvarez on 3/9/15.
//  Copyright (c) 2015 Jessie Alvarez. All rights reserved.
//

import UIKit

class BezierPathsView: UIView
{
    private var bezierPaths = [String:UIBezierPath]()
    
    func setPath(path: UIBezierPath?, named name: String) {
        bezierPaths[name] = path
        setNeedsDisplay()
    }
    
    override func drawRect(rect: CGRect) {
        for (_, path) in bezierPaths {
            path.stroke()
        }
    }
}
