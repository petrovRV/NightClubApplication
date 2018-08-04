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
        if let index = aboutUsPageViewController?.currentIndex {
            titleLabel.text = data.title[index]
            descriptionLabel.text = data.text[index]
            pageControl.currentPage = index
        }
    }
}

extension AboutUsViewController: AboutUsPageViewControllerDelegate {
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    
}
