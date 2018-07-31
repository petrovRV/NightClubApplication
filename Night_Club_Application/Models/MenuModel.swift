//
//  MenuModel.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 27/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import Foundation


class MenuItem {
    var name: String
    var glassPrice: String
    var bottlePrice: String
    var detail: String
    init(name: String, glassPrice: String, bottlePrice: String, detail: String) {
        self.name = name
        self.glassPrice = glassPrice
        self.bottlePrice = bottlePrice
        self.detail = detail
    }
}

class MenuModel {
    var sectionTitle: String
    var menuItems: [MenuItem]
    var isExpanded: Bool
    
    init(sectionTitle: String, menuItems: [MenuItem], isExpanded: Bool = false) {
        self.sectionTitle = sectionTitle
        self.menuItems = menuItems
        self.isExpanded = isExpanded
    }
    
    class func fetchData() -> [MenuModel] {
        
    let sectionData: [MenuModel] = [
        MenuModel(sectionTitle: "Vodka", menuItems: [
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: "")
            ]),
        MenuModel(sectionTitle: "Vodka", menuItems: [
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut", glassPrice: "12zł", bottlePrice: "190", detail: "")
            ]),
        MenuModel(sectionTitle: "Classic Cocktails", menuItems: [
            MenuItem(name: "Long Island Ice Tea", glassPrice: "34", bottlePrice: "", detail: "Absolute Blue, Havana Club 3yo, Seagrams, Olmeca Blanco triple sec S&S mix, cola"),
            MenuItem(name: "Long Island Ice Tea", glassPrice: "34", bottlePrice: "", detail: "Absolute Blue, Havana Club 3yo, Seagrams, Olmeca Blanco triple sec S&S mix, cola"),
            MenuItem(name: "Long Island Ice Tea", glassPrice: "34", bottlePrice: "", detail: "Absolute Blue, Havana Club 3yo, Seagrams, Olmeca Blanco triple sec S&S mix, cola"),
            MenuItem(name: "Long Island Ice Tea", glassPrice: "34", bottlePrice: "", detail: "Absolute Blue, Havana Club 3yo, Seagrams, Olmeca Blanco triple sec S&S mix, cola"),
            MenuItem(name: "Long Island Ice Tea", glassPrice: "34", bottlePrice: "", detail: "Absolute Blue, Havana Club 3yo, Seagrams, Olmeca Blanco triple sec S&S mix, cola"),
           MenuItem(name: "Long Island Ice Tea", glassPrice: "34", bottlePrice: "", detail: "Absolute Blue, Havana Club 3yo, Seagrams, Olmeca Blanco triple sec S&S mix, cola")
            ]),
        MenuModel(sectionTitle: "Shots", menuItems: [
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau"),
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau"),
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau"),
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau"),
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau"),
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau"),
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau"),
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau"),
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau"),
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau")
            ])
        ]
        return sectionData
    }
}

