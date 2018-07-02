//
//  LargePhotoViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 23/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class LargePhotoViewController: UIViewController {
    
    
    @IBOutlet weak var photoNumber: UILabel!
    @IBOutlet weak var largePhoto: UIImageView!
    var image: UIImage?
    var images: [UIImage] = []
    var currentImage = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        largePhoto.image = image
        print(currentImage)
    }

    
    @IBAction func backButton(_ sender: Any) {
    }
    @IBAction func nextButton(_ sender: Any) {
    }
    
    
}
