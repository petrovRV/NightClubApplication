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
    let headerHeight: CGFloat = 70
    override func viewDidLoad() {
        super.viewDidLoad()

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
extension MenuViewController: UITableViewDelegate, MenuHeaderViewDelegate {
    
    func toggleSection(header: MenuHeaderView, section: Int) {
        if sections[section].isExpanded == false {
            for i in 0...self.sections.count - 1 {
                self.sections[i].isExpanded = false
            }
        }
        sections[section].isExpanded = !sections[section].isExpanded
        
        UIView.transition(with: menuTableView, duration: 0.5, options: .curveLinear, animations: {
            self.menuTableView.reloadData()
            if self.sections[section].isExpanded == true {
                self.menuTableView.scrollToRow(at: IndexPath(row: 0, section: section), at: .top, animated: true)
            } else {
                self.menuTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
        }, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let headerHeight = ((menuTableView.frame.size.height) - CGFloat(2 * sections.count)) / CGFloat(sections.count)
        return headerHeight
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = MenuHeaderView()
        header.customInit(title: sections[section].sectionTitle, section: section, delegate: self)
        return header
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
}
