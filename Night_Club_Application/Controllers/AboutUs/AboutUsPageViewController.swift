//
//  AboutUsPageViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class AboutUsPageViewController: UIPageViewController {

    var data: AboutUsModel = AboutUsModel.fetchData()
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let startingViewController = contentViewController(at: 0)
        {
           setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension AboutUsPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! AboutUsContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! AboutUsContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> AboutUsContentViewController? {
        if index < 0 || index >= data.images.count {
            return nil
        }
        let storyboard = UIStoryboard(name: "AboutUsStoryboard", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifire: "AboutUsContentViewController") as? AboutUsContentViewController {
            pageContentViewController.imageFile = data.images[index]
            return pageContentViewController
        }
        return nil
    }
}
