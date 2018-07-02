//
//  ApartmentViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 13/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class ApartmentViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
  
    var apartmentPhotos = [#imageLiteral(resourceName: "apartament1"), #imageLiteral(resourceName: "apartament2"), #imageLiteral(resourceName: "apartament3"), #imageLiteral(resourceName: "apartament4"), #imageLiteral(resourceName: "apartament5")]


    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }


    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apartmentPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "Cell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ApartmentPhotoCell
        
        cell.apartmentImage.image = apartmentPhotos[indexPath.row]

        
        return cell
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let height = collectionView.frame.height
//        let width = height * 1.5
//        return CGSize(width: width, height: height)
//    }
}
