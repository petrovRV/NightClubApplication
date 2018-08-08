//
//  MenuHeaderView.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 27/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.

import UIKit

protocol MenuHeaderViewDelegate {
    func toggleSection(header: MenuTableViewHeader, section: Int)
}

class MenuTableViewHeader: UITableViewHeaderFooterView {
    var delegate: MenuHeaderViewDelegate?
    var section: Int!
    var imageView = UIImageView()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapHeader)))
        
        let marginGuide = contentView.layoutMarginsGuide

        contentView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        imageView.centerYAnchor.constraint(equalTo: marginGuide.centerYAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
      
    }
    
    func customInit(title: String, section: Int, delegate: MenuHeaderViewDelegate) {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapHeader(gestureRecognizer: UITapGestureRecognizer) {
        guard let  cell = gestureRecognizer.view as? MenuTableViewHeader else {
            return
        }
        delegate?.toggleSection(header: self, section: cell.section)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.textLabel?.textColor = UIColor.white
        self.contentView.backgroundColor = UIColor(red: CGFloat(200/255.0), green: CGFloat(192/255.0), blue: CGFloat(195/255.0), alpha: CGFloat(0.8))
    }
    
    func setExtended(_ extended: Bool) {
        
//        extended ? imageView.image = #imageLiteral(resourceName: "icons8-subtract-60") : imageView.image = #imageLiteral(resourceName: "icons8-plus-math-60")
        if extended {
              self.imageView.image = #imageLiteral(resourceName: "icons8-subtract-60")
        } else {
            self.imageView.image = #imageLiteral(resourceName: "icons8-plus-math-60")
        }
    }
}
