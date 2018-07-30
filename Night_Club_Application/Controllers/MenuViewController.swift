//
//  MenuViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 27/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var sections = [MenuModel(sectionTitle: "VODKA", rowsInSection: [("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł")], isExpanded: false), MenuModel(sectionTitle: "GIN", rowsInSection: [("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł")], isExpanded: false), MenuModel(sectionTitle: "RUM", rowsInSection: [("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł")], isExpanded: false), MenuModel(sectionTitle: "TEQUILA", rowsInSection: [("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł")], isExpanded: false), MenuModel(sectionTitle: "WHISKEY", rowsInSection: [("Absolut", "0.55zł"), ("Absolut", "0.55zł"), ("Absolut", "0.55zł")], isExpanded: false), MenuModel(sectionTitle: "SHOTS", rowsInSection: [("B52", "23zł"), ("MAD DOG", "15zł"), ("FLAT LINER", "18zł"), ("FRUIT SHOTS", "28zł")], isExpanded: false), MenuModel(sectionTitle: "CLASSIC COCKTAILS", rowsInSection: [("LONG ISLAND ICE TEA", "34zł"), ("COSMOPOLITAN", "25zł"), ("WHITE RUSSIAN", "0.21zł")], isExpanded: false)]
    
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
        return sections[section].rowsInSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath) as! MenuTableViewCell
        cell.nameLabel.text = sections[indexPath.section].rowsInSection[indexPath.row].name
        cell.priceLabel.text = sections[indexPath.section].rowsInSection[indexPath.row].price
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return sections[indexPath.section].isExpanded ? 30 : 0
        
    }
  
}
extension MenuViewController: UITableViewDelegate {
    
//    func toggleSection(header: MenuHeaderView, section: Int) {
//        if sections[section].isExpanded == false {
//            for i in 0...self.sections.count - 1 {
//                self.sections[i].isExpanded = false
//            }
//        }
//        sections[section].isExpanded = !sections[section].isExpanded
//
//        UIView.transition(with: menuTableView, duration: 0.5, options: .curveLinear, animations: {
//            self.menuTableView.reloadData()
//            if self.sections[section].isExpanded == true {
//                self.menuTableView.scrollToRow(at: IndexPath(row: 0, section: section), at: .top, animated: true)
//            } else {
//                self.menuTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
//            }
//        }, completion: nil)
//    }
 
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerHeight = ((menuTableView.frame.size.height) - CGFloat(2 * sections.count)) / CGFloat(sections.count)
        return 50
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
        //        for i in 0 ..< sections[section].rowsInSection.count {
        //            menuTableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        menuTableView.reloadSections(NSIndexSet(index: section) as IndexSet, with: .automatic)
        //        }
//        menuTableView.endUpdates()
    }
    
}


