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
        MenuModel(sectionTitle: "VODKA", menuItems: [
            MenuItem(name: "Absolut", glassPrice: "12", bottlePrice: "190", detail: ""),
            MenuItem(name: "Absolut Elyx", glassPrice: "26", bottlePrice: "440", detail: ""),
            MenuItem(name: "Absolut Elyx Magnum", glassPrice: "26", bottlePrice: "900", detail: ""),
            MenuItem(name: "Wyborowa Exqusite", glassPrice: "26", bottlePrice: "440", detail: ""),
            MenuItem(name: "Grey Goose", glassPrice: "12", bottlePrice: "190", detail: ""),
            MenuItem(name: "Ostoya", glassPrice: "20", bottlePrice: "350", detail: ""),
            MenuItem(name: "Ostoya 1.75 L", glassPrice: "26", bottlePrice: "800", detail: ""),
            MenuItem(name: "Becherovka", glassPrice: "14", bottlePrice: "245", detail: ""),
            MenuItem(name: "Zubrówka", glassPrice: "12", bottlePrice: "225", detail: "")
            ]),
        MenuModel(sectionTitle: "GIN", menuItems: [
            MenuItem(name: "Beefeter", glassPrice: "16", bottlePrice: "280", detail: ""),
            MenuItem(name: "Beefeter 24", glassPrice: "20", bottlePrice: "350", detail: ""),
            MenuItem(name: "Bombay Sapphire", glassPrice: "22", bottlePrice: "385", detail: ""),
            MenuItem(name: "Hendrick's", glassPrice: "30", bottlePrice: "525", detail: "")
            ]),
        MenuModel(sectionTitle: "RUM", menuItems: [
            MenuItem(name: "Havana Club 3 yo", glassPrice: "16", bottlePrice: "280", detail: ""),
            MenuItem(name: "Havana Club Especial", glassPrice: "18", bottlePrice: "315", detail: ""),
            MenuItem(name: "Havana Club 4 yo", glassPrice: "18", bottlePrice: "315", detail: ""),
            MenuItem(name: "Havana Selection", glassPrice: "40", bottlePrice: "735", detail: "")
            ]),
        MenuModel(sectionTitle: "TEQUILA", menuItems: [
            MenuItem(name: "Olmeca Blanco", glassPrice: "16", bottlePrice: "280", detail: ""),
            MenuItem(name: "Olmeca Gold", glassPrice: "16", bottlePrice: "280", detail: ""),
            MenuItem(name: "Olmeca Chocolate", glassPrice: "16", bottlePrice: "280", detail: ""),
            MenuItem(name: "Olmeca Altos Plata", glassPrice: "25", bottlePrice: "435", detail: ""),
            MenuItem(name: "Olmeca Altos Reposada", glassPrice: "25", bottlePrice: "435", detail: ""),
            MenuItem(name: "Patron Reposado", glassPrice: "50", bottlePrice: "875", detail: ""),
            ]),
        MenuModel(sectionTitle: "LIQUEURS", menuItems: [
            MenuItem(name: "Malibu", glassPrice: "16", bottlePrice: "  -", detail: ""),
            MenuItem(name: "Hahlua", glassPrice: "16", bottlePrice: "  -", detail: ""),
            MenuItem(name: "Archers", glassPrice: "16", bottlePrice: "  -", detail: ""),
            MenuItem(name: "Baileys", glassPrice: "16", bottlePrice: "  -", detail: ""),
            MenuItem(name: "Jagermaister", glassPrice: "16", bottlePrice: "  -", detail: ""),
            MenuItem(name: "Cointreau", glassPrice: "16", bottlePrice: "  -", detail: ""),
            MenuItem(name: "Sambuca", glassPrice: "16", bottlePrice: "  -", detail: ""),
            MenuItem(name: "De Kuyper", glassPrice: "16", bottlePrice: "  -", detail: "")
            ]),
        MenuModel(sectionTitle: "COGNAC", menuItems: [
            MenuItem(name: "Martell VS", glassPrice: "30", bottlePrice: "  -", detail: ""),
            MenuItem(name: "Martell XO", glassPrice: "90", bottlePrice: "  -", detail: "")
            ]),
        MenuModel(sectionTitle: "CLASSIC COCKTAILS", menuItems: [
            MenuItem(name: "Long Island Ice Tea", glassPrice: "34", bottlePrice: "", detail: "Absolute Blue, Havana Club 3yo, Seagrams, Olmeca Blanco triple sec S&S mix, cola"),
            MenuItem(name: "Cosmopolitan", glassPrice: "25", bottlePrice: "", detail: "Absolute Blue, Cintreau, cranberry juice, lime"),
            MenuItem(name: "White Russian", glassPrice: "34", bottlePrice: "", detail: "Absolut Blue, Kahlua, milk"),
            MenuItem(name: "Pina Colada", glassPrice: "25", bottlePrice: "", detail: "Havana Club 3yo, Malibu, pineapple, milk"),
            MenuItem(name: "Old Fashioned", glassPrice: "30", bottlePrice: "", detail: "Jim Beam, Angostura Bitters"),
           MenuItem(name: "Negroni", glassPrice: "23", bottlePrice: "", detail: "Gin, Campari, Martini Rosso")
            ]),
        MenuModel(sectionTitle: "APERITIF", menuItems: [
            MenuItem(name: "Lillet Blanc", glassPrice: "14", bottlePrice: "  -", detail: ""),
            MenuItem(name: "Lillet Rose", glassPrice: "14", bottlePrice: "  -", detail: ""),
            MenuItem(name: "Ricard", glassPrice: "14", bottlePrice: "  -", detail: ""),
            MenuItem(name: "Martini", glassPrice: "16", bottlePrice: "  -", detail: "")
            ]),
        MenuModel(sectionTitle: "SHOTS", menuItems: [
            MenuItem(name: "B-52", glassPrice: "23", bottlePrice: "", detail: "Baileys, Kahlua, Coinreau"),
            MenuItem(name: "Mad Dog", glassPrice: "15", bottlePrice: "", detail: "Absolut Blue, grenadine, tobasco"),
            MenuItem(name: "Flat Liner", glassPrice: "18", bottlePrice: "", detail: "Omelca Blanco, Sambuca"),
            MenuItem(name: "Fruit Shots", glassPrice: "28", bottlePrice: "", detail: "Absolut Blue 4cl, fruit preee, S&S mix")
            ]),
        MenuModel(sectionTitle: "COLLINS DRINKS", menuItems: [
            MenuItem(name: "Collins Maracuja", glassPrice: "23", bottlePrice: "", detail: "gin, puree pasion fruits, S&S mix, sparkling water"),
            MenuItem(name: "Collins Kiwi", glassPrice: "15", bottlePrice: "", detail: "Absolute Blue, kiwi, S&S mix, sparkling water"),
            MenuItem(name: "Collins Paspberry", glassPrice: "18", bottlePrice: "", detail: "Absolute Blue, kiwi, S&S mix, sparkling water")
            ])
        ]
        return sectionData
    }
}

