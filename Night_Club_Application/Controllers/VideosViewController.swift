//
//  VideosViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit
class VideosViewController: UIViewController {

    let videosService = VideosNetworkService()
    var responceVideos = [Videos]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videosService.loadVideosData() { [weak self]
            responce in
            print(responce)
            
        }
        
        
    }


}
