//
//  MainView.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var session: SessionStore
    //@EnvironmentObject var dataManager: FirestoreDataManager
    //@EnvironmentObject var foodDatabase: [FoodElement]
    
    func getUser() {
        session.listen()
    }
    
    var body: some View {
        Group {
            if (session.user != nil) {
                NavigationTabView()
            } else {
                LoginView()
            }
        }.onAppear(perform: getUser)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
