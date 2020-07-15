//
//  PreferenceStore.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 10/04/2021.
//  Copyright © 2021 AnissaBokhamy. All rights reserved.
//

import Foundation

class PreferenceStore {
    
    //@Published var foodDatabase: [FoodElement]
    
    static func getUser() -> User? {
        FirebaseDataManager.getUser()
    }
}
