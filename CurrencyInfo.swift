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
    
    var currencies: [String] = [String]()
    
    init() {
        func learnCurrency(name: String) {
            currencies.append(name)
        }
        learnCurrency("coffee")
        learnCurrency("beer")
        learnCurrency("sushi")
        learnCurrency("ice cream")
    }
}