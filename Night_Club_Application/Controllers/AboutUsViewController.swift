//
//  AboutUsViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 13/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class AboutUsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var aboutUsTableView: UITableView!
    
    let aboutUsData: AboutUsModel = AboutUsModel.fetchData()
    var expandCell = false
    let tableHeaderViewHeight: CGFloat = 250.0
    var headerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderView()
    }
    
    func setupHeaderView() {
        headerView = aboutUsTableView.tableHeaderView
        aboutUsTableView.tableHeaderView = nil
        aboutUsTableView.addSubview(headerView)
        
        aboutUsTableView.contentInset = UIEdgeInsets(top: tableHeaderViewHeight, left: 0, bottom: 0, right: 0)
        
        // 64 for navigation bar
        aboutUsTableView.contentOffset = CGPoint(x: 0, y: -tableHeaderViewHeight + 64)
        
        aboutUsTableView.contentInset = UIEdgeInsets(top: tableHeaderViewHeight, left: 0, bottom: 0, right: 0)
        aboutUsTableView.contentOffset = CGPoint(x: 0, y: -tableHeaderViewHeight)
    }
    
   func updateHeaderView() {

        var headerRect = CGRect(x: 0, y: -tableHeaderViewHeight, width: aboutUsTableView.bounds.width, height: tableHeaderViewHeight)
    
        if aboutUsTableView.contentOffset.y < -tableHeaderViewHeight {
        headerRect.origin.y = aboutUsTableView.contentOffset.y
        headerRect.size.height = -aboutUsTableView.contentOffset.y
    }
    
        headerView.frame = headerRect
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClubDetailTableViewCell", for: indexPath) as! ClubDetailTableViewCell
            cell.iconImageView.image = aboutUsData.aboutUsIcons[0]
            cell.detailTextView.text = aboutUsData.phoneNumber
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClubDetailTableViewCell", for: indexPath) as! ClubDetailTableViewCell
            cell.iconImageView.image = aboutUsData.aboutUsIcons[1]
            cell.detailTextView.text = aboutUsData.location
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClubDescriptionTableViewCell", for: indexPath) as! ClubDescriptionTableViewCell
            cell.descriptionTextLabel.text = aboutUsData.description
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkingHoursTableViewCell", for: indexPath) as! WorkingHoursTableViewCell
            if expandCell == true {
                cell.collapseArrow.image = aboutUsData.aboutUsIcons[2]
            } else {
                cell.collapseArrow.image = aboutUsData.aboutUsIcons[3]
            }
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HowToGetTableViewCell", for: indexPath) as! HowToGetTableViewCell
            cell.titleLable.text = aboutUsData.directionTitle
            cell.directionLabel.text = aboutUsData.directionText
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClubMapTableViewCell", for: indexPath) as! ClubMapTableViewCell
            cell.configure(location: aboutUsData.location)
            return cell
        default:
            fatalError("Failed to instantiate the table view cell")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 {
            if expandCell == true {
                return 100
            } else { return 40 }
            
        } else {
            return UITableViewAutomaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            
            expandCell = !expandCell
            self.aboutUsTableView.beginUpdates()
            self.aboutUsTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            self.aboutUsTableView.endUpdates()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }

}

//extension AboutUsViewController: UITableViewDataSource {
//    
//}
//extension AboutUsViewController: UITableViewDelegate {
//    
//}
