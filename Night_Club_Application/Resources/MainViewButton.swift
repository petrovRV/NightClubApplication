//
//  MainViewButton.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 22/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class MainViewButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 150, green: 150, blue: 150, alpha: 1).cgColor
    }
}
