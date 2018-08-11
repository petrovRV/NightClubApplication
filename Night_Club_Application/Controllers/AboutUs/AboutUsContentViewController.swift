//
//  AboutUsContentViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 03/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class AboutUsContentViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var contentImageView: UIImageView!
    
    //MARK: Properties
    var index = 5
    var imageFile: UIImage? = nil
    
    //MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        contentImageView.image = imageFile
    }

}
