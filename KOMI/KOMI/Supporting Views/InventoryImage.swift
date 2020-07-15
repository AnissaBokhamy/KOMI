//
//  InventoryImage.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import SwiftUI

struct InventoryImage: View {
    
    var inventoryItem: InventoryItem
    
    var body: some View {
        ZStack {
            Image(inventoryItem.imageName!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .clipped()
                .cornerRadius(20)
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    Spacer()
                    
                    InfoLogo(logo: Image("apple"), infoText: "2 days")
                }
                Spacer()
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: 150, height: 50)
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient: .init(colors: [Color("Dark Grey"), .clear]), startPoint: .init(x: 0, y: 1), endPoint: .init(x: 0, y: 0)))
                    Text(inventoryItem.name)
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
        var inventoryItem = InventoryItem(name: "Apples")
        inventoryItem.imageName = "apple"
        
        return InventoryImage(inventoryItem:
            inventoryItem
        )
    }
}
