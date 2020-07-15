//
//  Food.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import UIKit

struct FoodElement: Codable {
    
    var id: UUID?
    var name: String?
    var foodType: FoodType?
    var category: InventoryItemCategory?
    var imageName: String?
    
    init(name: String){
        //self.id = "unknown"
        self.name = name
        self.category = .unknown
        self.imageName = "apple"
    }
    
    enum FoodType: String, Codable {
        case fruit = "fruit"
        case vegetable = "vegetable"
    }
    
    enum InventoryItemCategory: String, Codable {
        case pantry = "Pantry"
        case fridge = "Fridge"
        case freezer = "Freezer"
        case spicePantry = "Spice Pantry"
        case counter = "Counter"
        case unknown = "Unknown"
    }
    
    /*enum FoodType: String {
        case mainCourse = "String"
    }*/
}

