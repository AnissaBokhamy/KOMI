//
//  MainView.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    let inventory = [InventoryItem(name: "Apples"), InventoryItem(name: "Lasagna"), InventoryItem(name: "Apple pie")]
    
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(named: "Dark Green")
    }
    
    var body: some View {
        TabView {
            HomeView(toEatInInventory: self.inventory)
                .tabItem {
                    Image("summary")
                    Text("Home")
                }
        }
        .accentColor(.white)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
