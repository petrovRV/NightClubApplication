//
//  ReservationViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 01/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func makeAPhoneCall()  {
        let url: NSURL = URL(string: "TEL://1234567890")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
//    @IBAction func callButton(_ sender: Any) {
//         let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//        optionMenu.addAction(cancelAction)
//
//        present(optionMenu, animated: true, completion: nil)
//
//
//    }
    
    @IBAction func cellButton(_ sender: Any) {
        print("click")
        self.makeAPhoneCall()
        
//    let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
//    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
//    optionMenu.addAction(cancelAction)
//    let callAction = UIAlertAction(title: "Call " + "+4 881 888 888", style: .default, handler: callActionHandler)
//        optionMenu.addAction(callAction)
//
//    present(optionMenu, animated: true, completion: nil)
        
//    guard let number = URL(string: "tel://" + "1-408-555-5555") else {
//        print("fail")
//        return }
//    UIApplication.shared.open(number)
    }
//    let callActionHandler = { (action:UIAlertAction!) -> Void in
//        let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
//        alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//
//    }
    
}
