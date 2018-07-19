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
    
    var viewOffset: CGFloat = 230
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topViewButtomConstraint.constant = 0
        self.topViewIcon.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.blurView.effect = nil
        self.blurView.isHidden = false
        self.view.layoutIfNeeded()
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.drag(_:)))
        
    self.contactsView.addGestureRecognizer(panRecognizer)
    }
    
    
    @IBAction func Cellll(_ sender: Any) {
        makeAPhoneCall()
    }
    @objc func drag (_ gesture: UIPanGestureRecognizer) {
        
        switch gesture.state {
        case .began:
            animateView(to: state.reverse, duration: 0.4)
        case .changed:
            let translation = gesture.translation(in: contactsView)
            let fraction = abs(translation.y / viewOffset)
            
            animators.forEach{ (animator) in
                animator.fractionComplete = fraction
            }
        case .ended:
            animators.forEach{ $0.continueAnimation(withTimingParameters: nil, durationFactor: 0) }
        default:
            break
        }
    }
    
    func makeAPhoneCall()  {
        let url: NSURL = URL(string: "TEL://1234567890")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func cellButton(_ sender: Any) {
        self.makeAPhoneCall()
    }
    
    func animateView(to state: State, duration: TimeInterval) {
        
        guard animators.isEmpty else { return }
        
        let basicAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeIn, animations: nil)
        
        basicAnimator.addAnimations {
            switch state {
            case .open:
                self.topViewButtomConstraint.constant = self.viewOffset
                self.contactsView.layer.cornerRadius = 50
            case .closed:
                self.topViewButtomConstraint.constant = 0
                self.contactsView.layer.cornerRadius = 0
            }
            self.view.layoutIfNeeded()
        }
        
        basicAnimator.addAnimations {
            switch state {
            case .open:
                self.contactsTitleConstraint.constant = 120
                self.topViewIcon.transform = CGAffineTransform(scaleX: 1, y: 1)
            case .closed:
                self.contactsTitleConstraint.constant = 22
                self.topViewIcon.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            self.view.layoutIfNeeded()
        }
        
        let blurAnimator = UIViewPropertyAnimator(duration: duration, controlPoint1: CGPoint(x: 0.8, y: 0.2), controlPoint2: CGPoint(x: 0.8, y: 0.2)) {
            switch state {
            case .open:
                self.blurView.effect = UIBlurEffect(style: .light)
            case .closed:
                self.blurView.effect = nil
            }
        }
        blurAnimator.scrubsLinearly = false
        
        blurAnimator.addCompletion { (animator) in
            self.animators.removeAll()
            self.state = self.state.reverse
        }
        
        animators.append(basicAnimator)
        animators.append(blurAnimator)
    }
}
