//
//  User.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 16/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import Foundation

class User: Codable {
    
    // User profile information
    var emailAddress: String?
    var firstName: String?
    var lastName: String?
    var numberOfAdults: Int?
    var numberOfChildren: Int?
    //var location:
    
    // User data
    var inventory: [InventoryItem]? = []
    
    init(id: String, emailAddress: String) {
        self.emailAddress = emailAddress
    }
}
