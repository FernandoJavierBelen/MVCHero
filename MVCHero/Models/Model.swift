//
//  Model.swift
//  MVCHero
//
//  Created by Fernado Belen on 29/09/2021.
//

import Foundation

class HeroStats: Codable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let img: String
    let legs: Int
    
    init(localized_name: String, primary_attr: String, attack_type: String, img: String, legs: Int) {
        self.localized_name = localized_name
        self.primary_attr = primary_attr
        self.attack_type = attack_type
        self.img = img
        self.legs = legs
    }
}


