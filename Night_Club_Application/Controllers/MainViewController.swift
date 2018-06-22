//
//  MainViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 01/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let instagramAppUrl = NSURL(string: "instagram://user?screen_name=xoxopartyclub")!
    let instagramWebUrl = NSURL(string: "https://instagram.com/xoxopartyclub")!
    let facebookAppUrl = NSURL(string: "facebook://user?screen_name=XOXOPARTY")!
    let facebookWebUrl = NSURL(string: "https://facebook.com/XOXOPARTY")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
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
    
    @IBAction func openFacebookPageButton(_ sender: Any) {
        openUrl(appUrl: facebookAppUrl, webUrl: facebookWebUrl)
    }
    @IBAction func openInstagramPageButton(_ sender: Any) {
        openUrl(appUrl: instagramAppUrl, webUrl: instagramWebUrl)
    }
    
}
