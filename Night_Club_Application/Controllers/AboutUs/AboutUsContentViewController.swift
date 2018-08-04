//
//  AboutUsContentViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 03/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class AboutUsContentViewController: UIViewController {

    @IBOutlet weak var contentImageView: UIImageView!
    
    var index = 0
    var imageFile = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView.image = UIImage(named: imageFile)
    }

}
