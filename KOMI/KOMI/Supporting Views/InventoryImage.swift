//
//  InventoryImage.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct InventoryImage: View {
    
    var inventoryItem: InventoryItem

    var body: some View {
        ZStack {
            if let imageUrl = FirebaseDataManager.getImage(named: inventoryItem.imageName ?? "") {
                WebImage(url: imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .cornerRadius(20)
            }
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Spacer()
                    
                    InfoLogo(logo: Image("timer"), infoText: "\(inventoryItem.daysBeforeRotten) days")
                }
                Spacer()
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: 150, height: 50)
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient: .init(colors: [Color("Dark Grey"), .clear]), startPoint: .init(x: 0, y: 1), endPoint: .init(x: 0, y: 0)))
                    Text(inventoryItem.referencedFoodElement?.name ?? "NO NAME")
                        .font(.headline)
                        .foregroundColor(Color("Beige"))
                        .padding(.leading, 15)
                        .padding(.bottom, 5)
                        
                }
            }
            .overlay( RoundedRectangle(cornerRadius: 20).stroke(Color("Dark Grey"), lineWidth: 2))
            .frame(width: 150, height: 150)
            .cornerRadius(20)
            .clipped()
            
        }
    }
}


struct InventoryImage_Previews: PreviewProvider {
    static var previews: some View {
        var inventoryItem = InventoryItem(foodName: "Apples")
        inventoryItem.imageName = "apple"
        
        return InventoryImage(inventoryItem:
            inventoryItem
        )
    }
}
