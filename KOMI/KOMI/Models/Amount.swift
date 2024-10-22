//
//  Amount.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import Foundation

public struct Amount: Codable {
    var amountNumber: Double
    var unitName: String
    var unitAbbreviation: String
    
    init(number: Double) {
        amountNumber = number
        unitName = ""
        unitAbbreviation = ""
    }
}
