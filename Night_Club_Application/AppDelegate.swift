//
//  AppDelegate.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 01/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            
            if granted {
                print("User notifications are allowed.")
            } else {
                print("User notifications are not allowed.")
            }
        }
        
        return true
    }

}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        if response.actionIdentifier == "nightclub.makeReservation" {
            
            let url: NSURL = URL(string: "TEL://1234567890")! as NSURL
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        completionHandler()
    }
}
