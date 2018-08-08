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
    
    @IBOutlet weak var arrowImage: UIImageView!
    
    

    var state: State = .closed
    
    
    var animators: [UIViewPropertyAnimator] = []
    
    var viewOffset: CGFloat = 242
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.topViewButtomConstraint.constant = 0
        self.topViewIcon.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        self.blurView.effect = nil
        self.blurView.isHidden = false
        self.blurView.isHidden = true
        self.view.layoutIfNeeded()
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.drag(_:)))
        
    self.contactsView.addGestureRecognizer(panRecognizer)
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
    
    @IBAction func makeCell(_ sender: Any) {
        makeAPhoneCall()
    }
    
    func makeAPhoneCall()  {
        let url: NSURL = URL(string: "TEL://+48881216566")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
    
    
    func animateView(to state: State, duration: TimeInterval) {
        
        guard animators.isEmpty else { return }
        
        let basicAnimator = UIViewPropertyAnimator(duration: duration, curve: .easeIn, animations: nil)
        
        basicAnimator.addAnimations {
            switch state {
            case .open:
                self.topViewButtomConstraint.constant = self.viewOffset
                self.contactsView.layer.cornerRadius = 40
            case .closed:
                self.topViewButtomConstraint.constant = 0
                self.contactsView.layer.cornerRadius = 0
            }
            self.view.layoutIfNeeded()
        }
        
        basicAnimator.addAnimations {
            switch state {
            case .open:
                self.contactsTitleConstraint.constant = 70
                self.topViewIcon.transform = CGAffineTransform(scaleX: 1, y: 1)
            case .closed:
                self.contactsTitleConstraint.constant = 20
                self.topViewIcon.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
            self.view.layoutIfNeeded()
        }
        
        basicAnimator.addAnimations {
            switch state {
            case .open:
        
                self.arrowImage.alpha = 0
            case .closed:
                self.arrowImage.alpha = 1
            }
            self.view.layoutIfNeeded()
        }
        
        let blurAnimator = UIViewPropertyAnimator(duration: duration, controlPoint1: CGPoint(x: 0.8, y: 0.2), controlPoint2: CGPoint(x: 0.8, y: 0.2)) {
            switch state {
            case .open:
                self.blurView.isHidden = false
                self.blurView.effect = UIBlurEffect(style: .light)
            case .closed:
                self.blurView.isHidden = true
                self.blurView.effect = nil
            }
        }
        blurAnimator.scrubsLinearly = false
        
        blurAnimator.addCompletion { (animator) in
            self.animators.removeAll()
            self.state = self.state.reverse
//            switch state {
//            case .open:
//                self.arrowImage.image = #imageLiteral(resourceName: "icon-arrow-open")
//            case .closed:
//              self.arrowImage.image = #imageLiteral(resourceName: "icon-arrow-close")
//            }
        }
        
        animators.append(basicAnimator)
        animators.append(blurAnimator)
    }
}
