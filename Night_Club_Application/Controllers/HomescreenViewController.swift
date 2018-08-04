//
//  HomescreenViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class HomescreenViewController: UIViewController {

    var images = [#imageLiteral(resourceName: "HomeIcon-1"), #imageLiteral(resourceName: "HomeIcon-2"), #imageLiteral(resourceName: "HomeIcon-3")]
    var names = ["O nas", "Mapa", "Rezerwacja"]
    var storyboardNames = ["AboutUsStoryboard", "MapStoryboard", "ReservationStoryboard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension HomescreenViewController: UICollectionViewDataSource {
    
    
}

extension HomescreenViewController: UICollectionViewDelegate {
    
}
