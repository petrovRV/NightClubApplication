//
//  LocalNotification.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import Foundation
import UserNotifications

class LocalNotification {
    
    func addNotification() {
        
        let content = UNMutableNotificationContent()
        content.title = "ZORGANIZUJ SWOJĄ IMPREZĘ!"
        content.subtitle = "XOXO Party"
        content.body = "Doskonała lokalizacja w centrum Warszawy i muzyka na najwyższym poziomie"
        content.sound = UNNotificationSound.default()
        
        let categoryIdentifer = "nightclub.action"
        let makeReservationAction = UNNotificationAction(identifier: "nightclub.makeReservation", title: "Zarezerwować stolik", options: [.foreground])
        let cancelAction = UNNotificationAction(identifier: "nightclub.cancel", title: "Później", options: [])
        let category = UNNotificationCategory(identifier: categoryIdentifer, actions: [makeReservationAction, cancelAction], intentIdentifiers: [], options: [])
        UNUserNotificationCenter.current().setNotificationCategories([category])
        content.categoryIdentifier = categoryIdentifer
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 86400, repeats: false)
        let request = UNNotificationRequest(identifier: "nightclub.notification", content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}
