//
//  HomeView.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 26/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import SwiftUI

struct NavigationTabView: View {
    
    @EnvironmentObject var session: SessionStore

    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(named: "Dark Green")
    }
    
    var body: some View {
        TabView {
            SummaryView(toEatInInventory: session.user?.inventory ?? [InventoryItem]())
                .tabItem {
                    Image("summary")
                    Text("Home")
                }
        }
        .accentColor(.white)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let previewInventory: [InventoryItem] = [
            InventoryItem(foodName: "Apples"),
            InventoryItem(foodName: "Lasagna"),
            InventoryItem(foodName: "Apple pie")
        ]
        NavigationTabView()
    }
}
