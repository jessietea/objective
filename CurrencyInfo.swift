//
//  CurrencyInfo.swift
//  Objective
//
//  Created by Jessie Alvarez on 3/10/15.
//  Copyright (c) 2015 Jessie Alvarez. All rights reserved.
//

import Foundation
import UIKit

class CurrencyInfo {
    
    struct Currency {
        var name: String
        //var image: UIImage
        var paths: [UIBezierPath]
    }
    
    var currencies: [String : Currency] = [String : Currency]()
    
    init() {
        func learnCurrency(name: String, paths: [UIBezierPath]) {
            currencies[name] = Currency(name: name, paths: paths)
        }
    }
}