//
//  LargePhotoViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 23/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class LargePhotoViewController: UIViewController, UIScrollViewDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var photoNumber: UILabel!
    @IBOutlet weak var largePhoto: UIImageView!
    @IBOutlet weak var nextOutlet: UIButton!
    @IBOutlet weak var backOutlet: UIButton!
    
    var images: [UIImage] = []
    var currentImage = 0
    enum NavigationHelper { case next; case previous; case firstLoad }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.minimumZoomScale = 1.0
        self.scrollView.maximumZoomScale = 3.0
        let sharePhotoButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(sharePhotoAction))
        self.navigationItem.rightBarButtonItem = sharePhotoButton
        
        updatePhoto(with: NavigationHelper.firstLoad)
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 1
        scrollView.addGestureRecognizer(tap)

    }

    @objc func handleTap(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .recognized
        {
            let touchLocation = recognizer.location(in: recognizer.view).x
            if touchLocation > (self.largePhoto.bounds.size.width / 2) {
                updatePhoto(with: NavigationHelper.next)
            } else {
                updatePhoto(with: NavigationHelper.previous)
            }
        }
    }
    private func updatePhoto(with navigate: NavigationHelper) {
        switch navigate {
        case .next:
            guard currentImage < images.count - 1 else {return}
            currentImage += 1
        case .previous:
            guard currentImage > 0 else {return}
            currentImage -= 1
        case .firstLoad:
            break
        }
        self.scrollView.setZoomScale(0.0, animated: false)
        photoNumber.text = "\(currentImage + 1)/\(images.count)"
        largePhoto.image = images[currentImage]
        disableNavigationButton()
    }
    
    
    func disableNavigationButton(){
        let lastImageIndex = self.images.count - 1
        switch currentImage {
        case 0:
            self.nextOutlet.isHidden = false
            self.backOutlet.isHidden = true
        case lastImageIndex: do {
            self.nextOutlet.isHidden = true
            self.backOutlet.isHidden = false
            }
        default:
            self.nextOutlet.isHidden = false
            self.backOutlet.isHidden = false
        }
    }
    
    
    
    @IBAction func nextButton(_ sender: Any) {
        
        updatePhoto(with: NavigationHelper.next)
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        updatePhoto(with: NavigationHelper.previous)
    }
  
    @objc func sharePhotoAction() {
        
        let imageToShare = images[currentImage]

        let activityViewController = UIActivityViewController(activityItems: [imageToShare], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.largePhoto
    }
}
