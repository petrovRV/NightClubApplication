//
//  AboutUsModel.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 27/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit


class AboutUsModel {
    
    var location: String
    var phoneNumber: String
    var description: String
    var directionTitle: String
    var directionText: String
    var aboutUsIcons: [UIImage]
    
    init(location: String, phoneNumber: String, description: String, directionTitle: String, directionText: String, aboutUsIcons: [UIImage]) {
        self.location = location
        self.phoneNumber = phoneNumber
        self.description = description
        self.directionTitle = directionTitle
        self.directionText = directionText
        self.aboutUsIcons = aboutUsIcons
    }
    
    class func fetchData() -> AboutUsModel {
        
        let location = "Marii Konopnickiej 6, 00-491 Warszawa"
        let phoneNumber = "+4881126566"
        let description = "XOXO Party to serce klubowego zagłębia przy legendarnej ulicy Mazowieckiej. Doskonała lokalizacja w centrum Warszawy, nowoczesne wnętrza wkomponowane w zabytkową architekturę i muzyka na najwyższym poziomie - wszystkie te cechy sprawiają, że XOXO party to najlepszy wybór na klubowej mapie Warszawy.  Wykwalifikowana obsługa, klimatyczne oświetlenie i profesjonalne nagłośnienie - to wszystko czeka na naszych gości w XOXO party."
        let directionTitle = "Do klubu dojść można na dwa sposoby:"
        let directionText = "pieszo: od Placu Trzech Krzyży, w przejściu pomiędzy budynkami (z napisem TEATR IMKA), tuż przed hotelem Sheraton (idąc od strony ulicy Książęcej). samochodem: jadąc ulicą Prusa należy skręcić w lewo zaraz za hotelem Sheraton."
        var aboutUsIcons = [UIImage]()
        aboutUsIcons.append(UIImage(named: "AboutUs-phone")!)
        aboutUsIcons.append(UIImage(named: "AboutUs-map")!)
        aboutUsIcons.append(UIImage(named: "AboutUs-collapse")!)
        aboutUsIcons.append(UIImage(named: "AboutUs-expand")!)
        
        let aboutUsData = AboutUsModel(location: location, phoneNumber: phoneNumber, description: description, directionTitle: directionTitle, directionText: directionText, aboutUsIcons: aboutUsIcons)
        
        return aboutUsData
    }
}

