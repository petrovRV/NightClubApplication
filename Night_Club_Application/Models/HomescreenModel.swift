//
//  HomescreenModel.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class HomescreenModel {
    var name: String
    var image: UIImage
    var storyboardName: String
    var viewControllerName: String
    
    init(name: String, image: UIImage, storyboardName: String, viewControllerName: String) {
        
        self.name = name
        self.image = image
        self.storyboardName = storyboardName
        self.viewControllerName = viewControllerName
    }
}
