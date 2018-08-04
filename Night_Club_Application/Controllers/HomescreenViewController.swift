//
//  HomescreenViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class HomescreenViewController: UIViewController {

    @IBOutlet weak var homescreenColectionView: UICollectionView!
    var images = [#imageLiteral(resourceName: "HomeIcon-1"), #imageLiteral(resourceName: "HomeIcon-2"), #imageLiteral(resourceName: "HomeIcon-3"), #imageLiteral(resourceName: "HomeIcon-1"), #imageLiteral(resourceName: "HomeIcon-2"), #imageLiteral(resourceName: "HomeIcon-3"), #imageLiteral(resourceName: "HomeIcon-2"), #imageLiteral(resourceName: "HomeIcon-3")]
    var names = ["O nas", "Mapa", "Rezerwacja", "O nas", "Mapa", "Rezerwacja", "O nas", "Mapa"]
    var storyboardNames = ["AboutUsStoryboard", "MapStoryboard", "ReservationStoryboard", "AboutUsStoryboard", "MapStoryboard", "ReservationStoryboard", "AboutUsStoryboard", "MapStoryboard"]
    private let notifacation = LocalNotification()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notifacation.addNotification()
    }
}

extension HomescreenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomescreenCollectionViewCell", for: indexPath) as! HomescreenCollectionViewCell
        cell.iconImage.image = images[indexPath.row]
        cell.nameLabel.text = names[indexPath.row]
        return cell
    }
    
}

extension HomescreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let name = "AboutUsViewController"
        let storyboard = UIStoryboard(name: "AboutUsStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomescreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 2
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
}
