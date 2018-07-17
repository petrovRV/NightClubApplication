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
    
    var expandCell = false
    let tableHeaderViewHeight: CGFloat = 242.0
    let tableHeaderViewCutaway: CGFloat = 25.0
    
    var headerView: UIView!
    var headerMaskLayer: CAShapeLayer!
    
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClubDetailTableViewCell", for: indexPath) as! ClubDetailTableViewCell
            cell.iconImageView.image = #imageLiteral(resourceName: "AboutUs-phone")
            cell.detailTextView.text = "+4881126566"
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClubDetailTableViewCell", for: indexPath) as! ClubDetailTableViewCell
            cell.iconImageView.image = #imageLiteral(resourceName: "AboutUs-map")
            cell.detailTextView.text = "Marii Konopnickiej 6, 00-491 Warszawa"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClubDescriptionTableViewCell", for: indexPath) as! ClubDescriptionTableViewCell
            cell.descriptionTextLabel.text = "XOXO Party to serce klubowego zagłębia przy legendarnej ulicy Mazowieckiej. Doskonała lokalizacja w centrum Warszawy, nowoczesne wnętrza wkomponowane w zabytkową architekturę i muzyka na najwyższym poziomie - wszystkie te cechy sprawiają, że XOXO party to najlepszy wybór na klubowej mapie Warszawy.  Wykwalifikowana obsługa, klimatyczne oświetlenie i profesjonalne nagłośnienie - to wszystko czeka na naszych gości w XOXO party."
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkingHoursTableViewCell", for: indexPath) as! WorkingHoursTableViewCell
            if expandCell == true {
                cell.collapseArrow.image = #imageLiteral(resourceName: "AboutUs-collapse")
            } else {
                cell.collapseArrow.image = #imageLiteral(resourceName: "AboutUs-expand")
            }
            return cell
            
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "HowToGetTableViewCell", for: indexPath) as! HowToGetTableViewCell
            cell.titleLable.text = "Do klubu dojść można na dwa sposoby:"
            cell.directionLabel.text = "pieszo: od Placu Trzech Krzyży, w przejściu pomiędzy budynkami (z napisem TEATR IMKA), tuż przed hotelem Sheraton (idąc od strony ulicy Książęcej). samochodem: jadąc ulicą Prusa należy skręcić w lewo zaraz za hotelem Sheraton."
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ClubMapTableViewCell", for: indexPath) as! ClubMapTableViewCell
            cell.configure(location: "Marii Konopnickiej 6, 00-491 Warszawa")
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
