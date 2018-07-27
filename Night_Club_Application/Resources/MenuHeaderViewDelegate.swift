//
//  MenuHeaderView.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 27/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.

import UIKit

protocol MenuHeaderViewDelegate {
    func toggleSection(header: MenuHeaderView, section: Int)
}

class MenuHeaderView: UITableViewHeaderFooterView {
    var delegate: MenuHeaderViewDelegate?
    var section: Int!
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectHeaderAction)))
    }
    
    func customInit(title: String, section: Int, delegate: MenuHeaderViewDelegate) {
        self.textLabel?.text = title
        self.section = section
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectHeaderAction(gestureRecognizer: UITapGestureRecognizer) {
        let cell = gestureRecognizer.view
        delegate?.toggleSection(header: self, section: cell.section)
    }
}
