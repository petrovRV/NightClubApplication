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
    
    private var data: [HomescreenModel] = [HomescreenModel(name: "Rezerwacja", image: #imageLiteral(resourceName: "HomeIcon-reservation"), storyboardName: "ReservationStoryboard", viewControllerName: "ReservationViewController"), HomescreenModel(name: "Zdjęcia", image: #imageLiteral(resourceName: "HomeIcon-gallery"), storyboardName: "GalleryStoryboard", viewControllerName: "GalleryViewController"), HomescreenModel(name: "Menu", image: #imageLiteral(resourceName: "HomeIcon-menu"), storyboardName: "MenuStoryboard", viewControllerName: "MenuViewController"), HomescreenModel(name: "Apartament", image: #imageLiteral(resourceName: "HomeIcon-apartment"), storyboardName: "ApartmentStoryboard", viewControllerName: "ApartmentViewController"), HomescreenModel(name: "Karty klubowe", image: #imageLiteral(resourceName: "HomeIcon-cards"), storyboardName: "ClubCardsStoryboard", viewControllerName: "ClubCardsViewController"), HomescreenModel(name: "Wideo", image: #imageLiteral(resourceName: "HomeIcon-videos"), storyboardName: "VideosStoryboard", viewControllerName: "VideosViewController")]
    private let notifacation = LocalNotification()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        notifacation.addNotification()
    }
    
    
    @IBAction func aboutUsButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "AboutUsStoryboard", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "AboutUsViewController") as! AboutUsViewController
        let navigationController = self.navigationController
        viewController.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Zamknąć", style: .plain, target: viewController, action: #selector(viewController.closeView))
        viewController.navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: viewController, action: nil)
        viewController.navigationController?.navigationBar.barStyle = .black
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromTop
        navigationController?.view.layer.add(transition, forKey: nil)
        navigationController?.pushViewController(viewController, animated: false)
    }
}

extension HomescreenViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomescreenCollectionViewCell", for: indexPath) as! HomescreenCollectionViewCell
        cell.iconImage.image = data[indexPath.row].image
        cell.nameLabel.text = data[indexPath.row].name
        return cell
    }
}

extension HomescreenViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storybaordName = data[indexPath.row].storyboardName
        let viewControllerName = data[indexPath.row].viewControllerName
        let storyboard = UIStoryboard(name: storybaordName, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: viewControllerName)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension HomescreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 2
        let height = (collectionView.frame.height - 6) / 3
        
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2.0
    }
}

extension HomescreenViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        let item = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        viewController.navigationItem.backBarButtonItem = item
    }
}
