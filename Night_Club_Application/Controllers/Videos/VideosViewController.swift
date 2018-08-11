//
//  VideosViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class VideosViewController: UIViewController {
   
    //MARK: Outlets
    @IBOutlet weak var videosTableView: UITableView!
    @IBOutlet weak var emptyVideosView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK: Properties
    let videosService = VideosNetworkService()
    var videosList = [Items]()
    let videoIndex = 0
    
    //MARK: UIViewController Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.videosTableView.rowHeight = UITableViewAutomaticDimension
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidesWhenStopped = true
        videosTableView.backgroundView = emptyVideosView
        videosTableView.backgroundView?.isHidden = true
        
        videosService.loadVideosData() { [weak self]
            responce in
            
            responce.forEach() { video in
                if video.id.videoId != nil {
                    self?.videosList.append(video)
                }
            }
            self?.reloadTableView()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVideo" {
            if let indexPath = videosTableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! PlayVideoViewController
                guard let videoId = videosList[indexPath.row].id.videoId else { return }
                destinationController.videoId = videoId
            }
        }
    }
    
    //MARK: Methods
    func reloadTableView() {
        activityIndicator.stopAnimating()
        if self.videosList.count > 0 {
            self.videosTableView.reloadData()
        } else {
            videosTableView.backgroundView?.isHidden = true
        }
    }
}

//MARK: UITableView data source
    extension VideosViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        cell.setPreviewAndName(with: videosList[indexPath.row])
       
        return cell
    }
}
