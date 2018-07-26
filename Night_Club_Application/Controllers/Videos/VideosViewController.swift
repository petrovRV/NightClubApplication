//
//  VideosViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class VideosViewController: UIViewController {
   
    
    @IBOutlet weak var videosTableView: UITableView!
    @IBOutlet weak var emptyVideosView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    let videosService = VideosNetworkService()
    var videosList = [Items]()
    var responceVideos = [(title: String, channelId: String, previewImage: String)]()
    let videoIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.startAnimating()
        self.activityIndicator.hidesWhenStopped = true
        videosTableView.backgroundView = emptyVideosView
        videosTableView.backgroundView?.isHidden = true
        
        videosService.loadVideosData() { [weak self]
            responce in
            
            responce.forEach() { video in
                if let id = video.id.videoId {
                    self?.videosList.append(video)
                    let videoInfo = (video.snippet.title, id, video.snippet.thumbnails.high.url)
                    self?.responceVideos.append(videoInfo)
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
    func reloadTableView() {
        activityIndicator.stopAnimating()
        if self.responceVideos.count > 0 {
            self.videosTableView.reloadData()
        } else {
            videosTableView.backgroundView?.isHidden = true
        }
    }
    
}

extension VideosViewController: UITableViewDataSource  {
    


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responceVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        
        cell.setPreviewAndName(with: videosList[indexPath.row])
       
        return cell
    }
}
