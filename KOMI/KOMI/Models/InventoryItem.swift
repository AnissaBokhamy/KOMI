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
    var daysBeforeRotten: Int
    
    override init(name: String){
        self.bestBeforeDate = Date()
        self.daysBeforeRotten = Calendar.current.dateComponents([.day], from: Date(), to: self.bestBeforeDate).day!
        super.init(name: name)
    }
}
