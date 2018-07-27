//
//  MenuViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 27/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    var section = [MenuModel(sectionTitle: "Vodka", rowsInSection:["1":"1", "1":"1", "1":"1", "1":"1", "1":"1", "1":"1", "1":"1", "1":"1"], isExpanded: false), MenuModel(sectionTitle: "Piwo", rowsInSection:["2":"1", "1":"1", "2":"1", "1":"1", "1":"1", "1":"1"], isExpanded: false), MenuModel(sectionTitle: "Whisky", rowsInSection:["2":"1", "3":"1", "2":"1"], isExpanded: false)]
    
    @IBOutlet weak var menuTableView: UITableView!
    let headerHeight: CGFloat = 70
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}
