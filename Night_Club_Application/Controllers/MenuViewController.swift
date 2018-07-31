//
//  MenuViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 27/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    @IBOutlet weak var menuTableView: UITableView!
    
    var sections = MenuModel.fetchData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension MenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].isExpanded ? sections[section].menuItems.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        
        let menuItem = sections[indexPath.section].menuItems[indexPath.row]
        cell.nameLabel.text = menuItem.name
        cell.priceLabel.text = menuItem.glassPrice
        cell.buttlePrice.text = menuItem.bottlePrice
        cell.itemDetail.text = menuItem.detail
        
        if menuItem.detail == "" {
            cell.bottleStackView.isHidden = false } else {
            cell.bottleStackView.isHidden = true
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableViewAutomaticDimension
    }
}

extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 44
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MenuTableViewHeader()
        header.customInit(title: sections[section].sectionTitle, section: section, delegate: self)
        header.setExtended(sections[section].isExpanded)
        return header
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
}

extension MenuViewController : MenuHeaderViewDelegate {
    
    func toggleSection(header: MenuTableViewHeader, section: Int) {
        sections[section].isExpanded = !sections[section].isExpanded
        
        menuTableView.reloadSections(IndexSet([section]), with: .automatic)

    }
}


