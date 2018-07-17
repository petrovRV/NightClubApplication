//
//  ApartmentViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 13/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class ApartmentOldViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
  
    @IBOutlet weak var apartmentPhotosCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    var apartmentPhotos = [#imageLiteral(resourceName: "apartament1"), #imageLiteral(resourceName: "apartament2"), #imageLiteral(resourceName: "apartament3"), #imageLiteral(resourceName: "apartament4"), #imageLiteral(resourceName: "apartament5")]


    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = apartmentPhotos.count

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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ApartmentGalleryCollectionViewCell
        
        cell.apartmentImage.image = apartmentPhotos[indexPath.row]

        
        return cell
    }
    func  scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let layout = self.apartmentPhotosCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        let offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(index)
        self.pageControl.currentPage = Int(roundedIndex)
       
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = height * 1.5
        return CGSize(width: width, height: height)
    }
}
