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
    var selector: UIView!
    
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
    
    @IBInspectable
    var textColor: UIColor = .lightGray {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor: UIColor = .darkGray {
        didSet {
            updateView()
        }
    }
    @IBInspectable
    var selectorTextColor: UIColor = .white {
        didSet {
            updateView()
        }
    }

    func updateView() {
        buttons.removeAll()
        subviews.forEach { $0.removeFromSuperview() }
        let buttonsTitles = commaSeparatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonsTitles {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            buttons.append(button)
        }
        
        
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        
        let selectorWidth = frame.width / CGFloat(buttonsTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.layer.cornerRadius = frame.height / 2
        selector.backgroundColor = selectorColor
        addSubview(selector)
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    
    }

    @objc func buttonTapped(button: UIButton) {
        for btn in buttons {
            btn.setTitleColor(textColor, for: .normal)
            if btn == button {
                btn.setTitleColor(selectorTextColor, for: .normal)
            }
        }
    }
    
    
    override func draw(_ rect: CGRect) {
        layer.cornerRadius = frame.height / 2
    }


}
