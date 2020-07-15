//
//  Food.swift
//  KOMI
//
//  Created by Anissa Bokhamy on 15/07/2020.
//  Copyright © 2020 AnissaBokhamy. All rights reserved.
//

import UIKit

public class Food: Identifiable {
    
    private static var idCounter = 0
    
    public var id: Int
    var name: String
    /*fileprivate*/ var imageName: String?
    
    init(name: String){
        self.id = Food.idCounter
        Food.idCounter += 1
        self.name = name
        self.imageName = "apple"
    }
}
