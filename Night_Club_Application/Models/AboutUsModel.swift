//
//  AboutUsModel1.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit


class AboutUsModel {
    
    var title: [String]
    var text: [String]
    var images: [UIImage]
    
    init(title: [String], text: [String], images: [UIImage]) {
      
        self.title = title
        self.text = text
        self.images = images
    }
    
    class func fetchData() -> AboutUsModel {
        
        let title = ["DANCEFLOOR POCZUJ XOXO", "BOGATE BARY XOXO", "PANORAMICZNA STREFA VIP", "LOŻE NA IMPREZIE. REZERWUJ TERAZ!", "ZORGANIZUJ SWOJĄ IMPREZĘ!", "PRIVE ROOM NOWA PRZESTRZEŃ", "TWÓJ EVENT FIRMOWY", "KARTA KLUBOWA VIP / LADIES", "AKTUALNOŚCI I WYDARZENIA"]
        
        let text = ["Do Waszej dyspozycji oddajemy fantastyczny DanceFloor, bar, loże z możliwością rezerwacji, podwyższane podesty do tańca. Wszystko to możecie obserwować z antresoli. Monitory, potężny projektor i super nagłośnienie gwarantuje 100% zadowolenia.",
            "W XOXO skorzystasz z Baru Głównego, w którym serwujemy wszystkie możliwe alkohole, drinki, softy. Na poziomie niżej znajdziesz dodatkowy Bar Dancefloor, w którym serwujemy energetyczny BOOM! Nasze kelnerki dostarczą do Twojej loży komplet zamówień!",
            "Strefa VIP to oczywiście coś specjalnego! Panoramiczny widok na cały klub i dodatkowy Bar wraz z wygodnymi siedzeniami to gwarancja super imprezy! Zarezerwuj Teraz!",
            "Do dyspozycji gości oddajemy Loże oraz Miejsca Siedzące ze stolikami na terenie całego klubu XOXO. Miej pewność, iż zdołasz odpocząć po energetycznym szaleństwie na parkiecie. Rezerwuj już dzisiaj swoje miejsce w naszym klubie!",
            "Myślisz o swoich urodzinach? Imieninach? Może już zbliża się magiczny moment kawalerskiego lub panieńskiego? W XOXO spędzisz czas w najlepszy możliwy sposób. Party With Friends. Tort? Confetti i tancerki z tancerzami na stole pełnym doborowych alkoholi? Zapraszamy!",
            "Pierwsza w Polsce, jedyna w pełni dyskretna strefa Premium. Specjalnie wyselekcjonowane trunki i niezależna obsługa. Zawsze świeża kawa Nespresso. Już niebawem więcej szczegółów!!!",
            "Elegancko hipsterska przestrzeń XOXO jest idealnym miejscem na Twój firmowy Event – zapraszamy do współpracy. Znajdziesz u nas wszystkie atrakcje potrzebne do zorganizowania niezapomnianej imprezy!",
            "Karta klubowa rodziny XOXO – VIP oraz LADIES upoważnia Cię do skorzystania z atrakcyjnych promocji w trakcji imprez! Jeżeli chcesz otrzymać swoją napisz do nas na adres e-mail: rezerwacje@xoxoparty.pl",
            "Bądź na bieżąco! Co tydzień nowe wydarzenia i niezapomniane przeżycia na parkiecie XOXO. Śledź nas na stronach Facebook oraz Instagram. Zachęcamy do korzystania z naszego newsletter’a – nie przegap niczego ważnego!"]
       
        var images = [UIImage]()
        for i in  0...8 {
            images.append(UIImage(named: "AboutUs-image\(i)")!)
        }

        
        let aboutUsData = AboutUsModel(title: title, text: text, images: images)
        
        return aboutUsData
    }
}

