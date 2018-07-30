//
//  ApartmentViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 12/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class ApartmentViewController: UIViewController {
    
    var apartmentData: ApartmentModel = ApartmentModel.fetchData()
    
    var pageControl: UIPageControl!
    var apartmentCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
//        invalidateLayout()

    }
    
    func invalidateLayout(){
        let indexPath = IndexPath(item: 0, section: 0)
        DispatchQueue.main.async {
            self.apartmentCollectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }  
}

extension ApartmentViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ApartmentGalleryTableViewCell", for: indexPath) as! ApartmentGalleryTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ApartmentTableViewCell", for: indexPath) as! ApartmentTableViewCell
            cell.detailImage.image = apartmentData.apartmentDetailImages[indexPath.row - 1]
            cell.detailLabel.text = apartmentData.apartmentDetailText[indexPath.row - 1]

            return cell
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let cell = cell as? ApartmentGalleryTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                self.apartmentCollectionView = cell.collectionView
                cell.pageControl.numberOfPages = self.apartmentData.apartmentImages.count
                self.pageControl = cell.pageControl
                cell.collectionView.reloadData()
            }
        }
    }
//    func tableView(_ tableView: UITableView, heightForRowAt
//        indexPath: IndexPath) -> CGFloat
//    {
//        if indexPath.row == 0 {
//            return tableView.bounds.height / 2.7
//        } else {
//            return UITableViewAutomaticDimension
//        }
//    }
}

extension ApartmentViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apartmentData.apartmentImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApartmentGalleryCollectionViewCell", for: indexPath) as! ApartmentGalleryCollectionViewCell
        
        cell.apartmentImage.image = apartmentData.apartmentImages[indexPath.row]
        
        return cell
    }
    func  scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {

        let layout = self.apartmentCollectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
        let offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludingSpacing
        let roundedIndex = round(abs(index))
        self.pageControl.currentPage = Int(roundedIndex)
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = collectionView.frame.width
        return CGSize(width: width, height: height)
    }
}
