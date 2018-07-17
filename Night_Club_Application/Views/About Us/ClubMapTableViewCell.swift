//
//  AboutUsMapCell.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 17/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit
import MapKit

class ClubMapTableViewCell: UITableViewCell {

    @IBOutlet var mapView: MKMapView!
    
    func configure(location: String) {

        let geoCoder = CLGeocoder()
        
        geoCoder.geocodeAddressString(location, completionHandler: { placemarks, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            if let placemarks = placemarks {
                let placemark = placemarks[0]
                
                let annotation = MKPointAnnotation()
                
                if let location = placemark.location {
                    annotation.coordinate = location.coordinate
                    self.mapView.addAnnotation(annotation)
                    
                    let region = MKCoordinateRegionMakeWithDistance(annotation.coordinate, 250, 250)
                    self.mapView.setRegion(region, animated: false)
                }
            }
            
        })
    }
}
