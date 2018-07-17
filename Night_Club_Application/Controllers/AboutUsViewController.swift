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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 4
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
            print("click")
            expandCell = !expandCell
            self.aboutUsTableView.beginUpdates()
            self.aboutUsTableView.reloadRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            self.aboutUsTableView.endUpdates()
        }
    }

}
