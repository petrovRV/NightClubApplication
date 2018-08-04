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
}

extension AboutUsViewController: AboutUsPageViewControllerDelegate {
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
}

