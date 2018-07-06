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
    
    var buttons = [UIButton]()
    
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
    
    @IBInspectable
    var commaSeparatedButtonTitles: String = "" {
        didSet {
            updateView()
        }
    }
    
    func updateView() {
        buttons.removeAll()
        
        let buttonsTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonsTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            buttons.append(button)
        }
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        addSubview(stackView)
    }
    
    
    
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
    }


}
