//
//  ApartmentPhotosCVFlowLauout.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 13/06/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class ApartmentPhotosFlowLayout: UICollectionViewFlowLayout {
    let standardItemAlpha: CGFloat = 0.5
    let standardItemScale: CGFloat = 0.5
    var isSetup = false
    
    override func prepare() {
        super.prepare()
        if isSetup == false {
            self.collectionView!.decelerationRate = UIScrollViewDecelerationRateNormal
            isSetup = true
        }
    }
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        var attributesCopy = [UICollectionViewLayoutAttributes]()
        
        for itemAttributes in attributes! {
            let itemAttributesCopy = itemAttributes.copy() as! UICollectionViewLayoutAttributes
            
            changeLayoutAttributes(itemAttributesCopy)
            attributesCopy.append(itemAttributesCopy)
        }
        
        return attributesCopy
    }
    
    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    func changeLayoutAttributes(_ attributes: UICollectionViewLayoutAttributes) {
        let collectionCenter = collectionView!.frame.size.width/2
        let offset = collectionView!.contentOffset.x
        let normalizedCenter = attributes.center.x - offset
        
        let maxDistance = self.itemSize.width + self.minimumLineSpacing
        let distance = min(abs(collectionCenter - normalizedCenter), maxDistance)
        
        let ratio = (maxDistance - distance)/maxDistance
        let alpha = ratio * (1 - self.standardItemAlpha) + self.standardItemAlpha
        let scale = ratio * (1 - self.standardItemScale) + self.standardItemScale
        
        attributes.alpha = alpha
        attributes.transform3D = CATransform3DScale(CATransform3DIdentity, scale, scale, 1)
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        let layoutAttributes = self.layoutAttributesForElements(in: collectionView!.bounds)
        
        let center = collectionView!.bounds.size.width / 2
        let proposedContentOffsetCenterOrigin = proposedContentOffset.x + center
        
        let closest = layoutAttributes!.sorted { abs($0.center.x - proposedContentOffsetCenterOrigin) < abs($1.center.x - proposedContentOffsetCenterOrigin) }.first ?? UICollectionViewLayoutAttributes()
        
        let targetContentOffset = CGPoint(x: floor(closest.center.x - center), y: proposedContentOffset.y)
        
        return targetContentOffset
    }
    
//    func setupCollectionView() {
//        self.collectionView!.decelerationRate = UIScrollViewDecelerationRateNormal
//        
//        let collectionSize = collectionView!.bounds.size
//        let yInset = (collectionSize.height - self.itemSize.height) / 2
//        let xInset = (collectionSize.width - self.itemSize.width) / 2
//        
//        self.sectionInset = UIEdgeInsetsMake(yInset, xInset, yInset, xInset)
//    }
}

