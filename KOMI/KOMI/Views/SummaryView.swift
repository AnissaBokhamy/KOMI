//
//  SummaryView.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import SwiftUI

struct SummaryView: View {

    var toEatInInventory: [InventoryItem]
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("À manger")
                    .font(.title)
                Text("avant qu'il ne soit trop tard")
                    .padding(.leading, 45.0)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 10) {
                    ForEach(toEatInInventory, content: { foodItem in
                        InventoryImage(inventoryItem: foodItem)
                    })
                }
            }
        }
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        let foodInventoryNames = ["Apples", "Lasagna", "Apple pie"]
        var inventory = [InventoryItem]()
        foodInventoryNames.forEach { foodName in
            inventory.append(InventoryItem(foodName: foodName))
        }
        
        return SummaryView(toEatInInventory: inventory)
    }
}
