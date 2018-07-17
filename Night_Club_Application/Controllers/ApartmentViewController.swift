//
//  ApartmentViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 12/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class ApartmentViewController: UIViewController {
    
    var pageControl: UIPageControl!
    var apartmentCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    var apartmentImages = [#imageLiteral(resourceName: "apartament1"), #imageLiteral(resourceName: "apartament2"), #imageLiteral(resourceName: "apartament3"), #imageLiteral(resourceName: "apartament4"), #imageLiteral(resourceName: "apartament5")]
    let detailImages = [#imageLiteral(resourceName: "apartment-icon-1"), #imageLiteral(resourceName: "apartment-icon-2"), #imageLiteral(resourceName: "apartment-icon-3"), #imageLiteral(resourceName: "apartment-icon-4")]
    let detailText = ["Niezależne nagłośnienie firmy VOID, oświetlenie, klimatyzacja, profesjonalna obsługa i trunki z najwyższej półki to tylko niektóre zalety Apartment by XOXO Party…", "Intymna powierzchnia Prive Roomu nie odcina Cię od imprezy, która trwa na parkiecie w klubie XOXO. Dzięki live streaming – śledzisz ją na bieżąco!", "Podczas, kiedy w klubie odbywa się tłoczna i głośna impreza – Prive Room może pozostać spokojnym miejscem spotkań biznesowych, kolacji lub innych uroczystości.", "I na odwrót! Kiedy XOXO już „zasypia”… Apartment budzi się do życia… bo to właśnie w nim odbywają się najlepsze, ekskluzywne afterparty Warszawy…"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        invalidateLayout()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "ApartmentsGalleryTableViewCell", for: indexPath) as! ApartmentGalleryTableViewCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! ApartmentTableViewCell
            cell.detailImage.image = detailImages[indexPath.row - 1]
            cell.detailLabel.text = detailText[indexPath.row - 1]
            return cell
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            if let cell = cell as? ApartmentGalleryTableViewCell {
                cell.collectionView.dataSource = self
                cell.collectionView.delegate = self
                self.apartmentCollectionView = cell.collectionView
                cell.pageControl.numberOfPages = self.apartmentImages.count
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
        print(apartmentImages.count)
        return apartmentImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "Cell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ApartmentGalleryCollectionViewCell
        
        cell.apartmentImage.image = apartmentImages[indexPath.row]
        
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
