//
//  GalleryViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 23/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let galleryPhotos = [#imageLiteral(resourceName: "apartament1"), #imageLiteral(resourceName: "apartament2"), #imageLiteral(resourceName: "apartament3"), #imageLiteral(resourceName: "apartament4"), #imageLiteral(resourceName: "apartament5"), #imageLiteral(resourceName: "apartament6"), #imageLiteral(resourceName: "apartament7"), #imageLiteral(resourceName: "apartament8"), #imageLiteral(resourceName: "apartament9"), #imageLiteral(resourceName: "apartament10")]
    var imageIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier = "GalleryCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! GalleryPhotoCell
        
        cell.galleryImage.image = galleryPhotos[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photo = galleryPhotos[indexPath.row]
        self.imageIndex = indexPath.row
        print(indexPath.row)
        
        performSegue(withIdentifier: "showImage", sender: photo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showImage" {
        
            let largePhotoVC = segue.destination as! LargePhotoViewController
            largePhotoVC.images = self.galleryPhotos
            largePhotoVC.image = sender as? UIImage
            largePhotoVC.currentImage = self.imageIndex
        }
    }
    
    
    
}

extension GalleryViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 3 - 1
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
