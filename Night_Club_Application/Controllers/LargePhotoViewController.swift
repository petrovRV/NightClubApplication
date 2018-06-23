//
//  LargePhotoViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 23/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class LargePhotoViewController: UIViewController {

    @IBOutlet weak var largePhoto: UIImageView!
    var image: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        largePhoto.image = image
    }

}
