//
//  MenuViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 27/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var sections = MenuModel.fetchData()
    
    @IBOutlet weak var menuTableView: UITableView!
    let tableHeaderViewHeight: CGFloat = 200
    var headerView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()

    }
    func setupHeaderView() {
        headerView = menuTableView.tableHeaderView
        menuTableView.tableHeaderView = nil
        menuTableView.addSubview(headerView)
        
        menuTableView.contentInset = UIEdgeInsets(top: tableHeaderViewHeight, left: 0, bottom: 0, right: 0)
        
        // 64 for navigation bar
        menuTableView.contentOffset = CGPoint(x: 0, y: -tableHeaderViewHeight + 64)
        
        menuTableView.contentInset = UIEdgeInsets(top: tableHeaderViewHeight, left: 0, bottom: 0, right: 0)
        menuTableView.contentOffset = CGPoint(x: 0, y: -tableHeaderViewHeight)
    }
    
    func updateHeaderView() {
        
        var headerRect = CGRect(x: 0, y: -tableHeaderViewHeight, width: menuTableView.bounds.width, height: tableHeaderViewHeight)
        
        if menuTableView.contentOffset.y < -tableHeaderViewHeight {
            headerRect.origin.y = menuTableView.contentOffset.y
            headerRect.size.height = -menuTableView.contentOffset.y
        }
        
        headerView.frame = headerRect
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
}

extension MenuViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.nameLabel.text = sections[indexPath.section].menuItems[indexPath.row].name
        cell.priceLabel.text = sections[indexPath.section].menuItems[indexPath.row].glassPrice
        cell.buttlePrice.text = sections[indexPath.section].menuItems[indexPath.row].bottlePrice
        cell.itemDetail.text = sections[indexPath.section].menuItems[indexPath.row].detail
        
        if sections[indexPath.section].menuItems[indexPath.row].detail == "" {
            cell.bottleStackView.isHidden = false } else {
            cell.bottleStackView.isHidden = true
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return sections[indexPath.section].isExpanded ? UITableViewAutomaticDimension : 0
        
    }
  
}
extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        let headerHeight = ((menuTableView.frame.size.height) - CGFloat(2 * sections.count)) / CGFloat(sections.count)
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
        
        
//        menuTableView.beginUpdates()
//                for i in 0 ..< sections[section].menuItems.count {
//                    menuTableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        menuTableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
//                }
//        menuTableView.endUpdates()
    }
    
}


