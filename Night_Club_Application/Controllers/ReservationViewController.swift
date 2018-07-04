//
//  ReservationViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 01/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {

    enum State {
        case closed
        case open
        
        var reverse: State {
            return self == .open ? .closed : .open
            
        }
    }
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    @IBOutlet weak var contactsView: UIView!
    @IBOutlet weak var topViewIcon: UILabel!
    @IBOutlet weak var topViewButtomConstraint: NSLayoutConstraint!
    @IBOutlet weak var contactsTitleConstraint: NSLayoutConstraint!

    var state: State = .closed
    var animators: [UIViewPropertyAnimator] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    
    func makeAPhoneCall()  {
        let url: NSURL = URL(string: "TEL://1234567890")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func cellButton(_ sender: Any) {
        self.makeAPhoneCall()
    }
    
    func animateView(toState: State, duration: TimeInterval) {
        
        let basicAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeIn, animations: nil)
        
        basicAnimator.addAnimations {
            switch self.state {
            case .open:
                self.topViewButtomConstraint.constant = 300
                self.contactsView.layer.cornerRadius = 50
            case .closed:
                self.topViewButtomConstraint.constant = 0
                self.contactsView.layer.cornerRadius = 0
            }
            self.view.layoutIfNeeded()
        }
        
        basicAnimator.addAnimations {
            switch self.state {
            case .open:
                self.contactsTitleConstraint.constant = 120
                self.topViewIcon.transform = CGAffineTransform(scaleX: 1, y: 1)
            case .closed:
                self.contactsTitleConstraint.constant = 52
                self.topViewIcon.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            self.view.layoutIfNeeded()
        }
        
        let blurAnimator = UIViewPropertyAnimator(duration: duration, controlPoint1: CGPoint(x: 0.8, y: 0.2), controlPoint2: CGPoint(x: 0.8, y: 0.2)) {
            switch self.state {
            case .open:
                self.blurView.effect = UIBlurEffect(style: .light)
            case .closed:
                self.blurView.effect = nil
            }
        }
    }
}
