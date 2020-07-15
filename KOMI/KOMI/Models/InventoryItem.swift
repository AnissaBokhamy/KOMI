//
//  InventoryItem.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import Foundation

public class InventoryItem: Food {
    
    var amount: Amount?
    var bestBeforeDate: Date
    
    override init(name: String){
        self.bestBeforeDate = Date()
        super.init(name: name)
    }
}
