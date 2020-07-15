//
//  InventoryManager.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 11/04/2021.
//  Copyright © 2021 AnissaBokhamy. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class InventoryManager {
    
    static private var db = Firestore.firestore()
    
    /*
    static func getInventory(for userId: String) -> [InventoryItem]? {
        
    }
    
    private static func loadInventory(for userId: String, success: (([InventoryItem]?) -> Void)?, failure: (() -> Void)?) {
        let collectionName = FirebaseDataManager.FirebaseCollection.inventory.name
        let document = db.collection(collectionName).document(userId)
        document.getDocument { (document, error) in
            if let document = document, document.exists {
                var retrievedInventory = [InventoryItem]()
                let inventoryData = document.data().map { inventoryItem in
                    retrievedInventory.append(InventoryItem(from: inventoryItem))
                }
                success?(retrievedInventory)
                return
            } else {
                print("Document does not exist")
                failure?()
                return
            }
        }
    }*/
    
    static func addToInventory(_ element: InventoryItem, for userId: String) {
        let collectionName = FirebaseDataManager.FirebaseCollection.inventory.name
        try? db.collection(collectionName).document(userId).setData(from: element)
    }
}
