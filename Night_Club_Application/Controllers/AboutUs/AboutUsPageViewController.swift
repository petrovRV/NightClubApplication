//
//  AboutUsPageViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

protocol AboutUsPageViewControllerDelegate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class AboutUsPageViewController: UIPageViewController {

    var data: AboutUsModel = AboutUsModel.fetchData()
    weak var aboutUsDelegate: AboutUsPageViewControllerDelegate?
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
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
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "AboutUsContentViewController") as? AboutUsContentViewController {
            pageContentViewController.imageFile = data.images[index]
            pageContentViewController.index = index
            return pageContentViewController
        }
        return nil
    }
}

extension AboutUsPageViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard completed else { return }
            if let contentViewController = pageViewController.viewControllers?.first as? AboutUsContentViewController {
                currentIndex = contentViewController.index
                
                aboutUsDelegate?.didUpdatePageIndex(currentIndex: contentViewController.index)
            }
//         guard let index = (pageViewController.viewControllers?.first as? AboutUsContentViewController)?.index else { return }

        
    }
}


