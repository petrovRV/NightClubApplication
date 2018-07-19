//
//  MainViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 01/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit
import UserNotifications

class MainViewController: UIViewController {

    let instagramAppUrl = NSURL(string: "instagram://user?screen_name=xoxopartyclub")!
    let instagramWebUrl = NSURL(string: "https://instagram.com/xoxopartyclub")!
    let facebookAppUrl = NSURL(string: "facebook://user?screen_name=XOXOPARTY")!
    let facebookWebUrl = NSURL(string: "https://facebook.com/XOXOPARTY")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNotification()
//        addNotification()
//        self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "backIndicatorImage")
//        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "backIndicatorImage")
//        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    func openUrl(appUrl: NSURL, webUrl: NSURL) {
        if UIApplication.shared.canOpenURL(appUrl as URL) {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(appUrl as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(appUrl as URL)
            }
        } else {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(webUrl as URL, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.openURL(webUrl as URL)
            }
        }
    }
    
    @IBAction func notification(_ sender: Any) {
        addNotification()
    }
    func addNotification(){
        
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
    
    @IBAction func openFacebookPageButton(_ sender: Any) {
        openUrl(appUrl: facebookAppUrl, webUrl: facebookWebUrl)
    }
    @IBAction func openInstagramPageButton(_ sender: Any) {
        openUrl(appUrl: instagramAppUrl, webUrl: instagramWebUrl)
    }
    
}
