//
//  NightClubInformation.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 19/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class NightClubInformation {
    
    var location: String
    var apartmentImages: [UIImage]
    var apartmentDetailImages: [UIImage]
    var apartmentDetailText: [String]
    
    
    
    init(location: String, apartmentImages: [UIImage], apartmentDetailImages: [UIImage], apartmentDetailText: [String])
    
    {
        self.location = location
        self.apartmentImages = apartmentImages
        self.apartmentDetailImages = apartmentDetailImages
        self.apartmentDetailText = apartmentDetailText
        
    }
    
    class func fetchInformation() -> NightClubInformation {
        let location = "Marii Konopnickiej 6, 00-491 Warszawa"
        var apartmentImages = [UIImage]()
        for i in  1...5 {
            apartmentImages.append(UIImage(named: "apartament\(i)")!)
        }
        var apartmentDetailImages = [UIImage]()
        
        for i in  1...4 {
            apartmentDetailImages.append(UIImage(named: "apartment-icon-\(i)")!)
        }
        let apartmentDetailText = ["Niezależne nagłośnienie firmy VOID, oświetlenie, klimatyzacja, profesjonalna obsługa i trunki z najwyższej półki to tylko niektóre zalety Apartment by XOXO Party…", "Intymna powierzchnia Prive Roomu nie odcina Cię od imprezy, która trwa na parkiecie w klubie XOXO. Dzięki live streaming – śledzisz ją na bieżąco!", "Podczas, kiedy w klubie odbywa się tłoczna i głośna impreza – Prive Room może pozostać spokojnym miejscem spotkań biznesowych, kolacji lub innych uroczystości.", "I na odwrót! Kiedy XOXO już „zasypia”… Apartment budzi się do życia… bo to właśnie w nim odbywają się najlepsze, ekskluzywne afterparty Warszawy…"]
        
        let nightClubInformation = NightClubInformation(location: location, apartmentImages: apartmentImages, apartmentDetailImages: apartmentDetailImages, apartmentDetailText: apartmentDetailText)
        
        
        
        return nightClubInformation
    }
    
    
    
}

