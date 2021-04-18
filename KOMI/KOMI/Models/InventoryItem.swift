//
//  InventoryItem.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import Foundation

public class InventoryItem: Identifiable, Codable {
    
    public var id: UUID?
    var referencedFoodElement: FoodElement?
    var amount: Amount?
    var bestBeforeDate: Date?
    var daysBeforeRotten: Int?
    var imageName: String?
    
    init(foodName: String){
        //self.referencedFoodElement =
        //self.bestBeforeDate = Date()
        id = UUID()
        referencedFoodElement = FoodElement(name: foodName)
        amount = Amount(number: 0)
        guard let bestBeforeDate = bestBeforeDate else { return }
        self.daysBeforeRotten = Calendar.current.dateComponents([.day], from: Date(), to: bestBeforeDate).day
    }
}

