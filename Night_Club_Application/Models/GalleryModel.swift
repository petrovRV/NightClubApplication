//
//  GalleryModel.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 19/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class GalleryModel {
    
    var images: [UIImage]
    
    init(images: [UIImage]) {
        self.images = images
    }
    
    class func fetchData() -> GalleryModel {
        
        var galleryImages = [UIImage]()
        for i in  1...29 {
            galleryImages.append(UIImage(named: "gallery-\(i)")!)
        }
        let galleryData = GalleryModel(images: galleryImages)
        
        return galleryData
    }
}

