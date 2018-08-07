//
//  AboutUsViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var bottomLine: UIView!
    
    
    var aboutUsPageViewController: AboutUsPageViewController?
    var data: AboutUsModel = AboutUsModel.fetchData()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = data.title.count
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let pageViewController = segue.destination as? AboutUsPageViewController {
            aboutUsPageViewController = pageViewController
            aboutUsPageViewController?.aboutUsDelegate = self
        }
    }

    func updateUI() {
        guard let index = aboutUsPageViewController?.currentIndex else { return }
            changeLabels(index: index)
            pageControl.currentPage = index
     }
    
    func changeLabels(index: Int) {
        
        UIView.transition(with: titleLabel,
                          duration: 1,
                          options: .curveEaseIn,
                          animations: { [weak self] in
                            self?.titleLabel.alpha = 0
                            self?.titleLabel.text = self?.data.title[index]
                            self?.titleLabel.alpha = 1
            }, completion: nil)
        
        UIView.transition(with: descriptionLabel,
                              duration: 1,
                              options: .curveEaseIn,
                              animations: { [weak self] in
                                self?.descriptionLabel.alpha = 0
                                self?.descriptionLabel.text = self?.data.text[index]
                                self?.descriptionLabel.sizeToFit()
                                guard let centerY = self?.view.frame.width else { return }
                                self?.descriptionLabel.center.x = centerY / 2
                                self?.descriptionLabel.alpha = 1
                }, completion: nil)
        }
    
    @objc func closeView() {
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionReveal
        transition.subtype = kCATransitionFromBottom
        navigationController?.view.layer.add(transition, forKey: nil)
        _ = navigationController?.popViewController(animated: false)
    }
    
    func openUrl(with social: SocialURL) {
        
        let res = UIApplication.shared.canOpenURL(social.getAppURL())
        let url = res ? social.getAppURL() : social.getWebURL()
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    @IBAction func openInstagramButton(_ sender: Any) {
         openUrl(with: .instagram)
    }
    @IBAction func openFacebookButton(_ sender: Any) {
          openUrl(with: .facebook)
    }

}

extension AboutUsViewController: AboutUsPageViewControllerDelegate {
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
}

