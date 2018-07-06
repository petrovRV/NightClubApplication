//
//  CustomSegmentedControl.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 06/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit


@IBDesignable
class CustomSegmentedControl: UIView {
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
    }


}
