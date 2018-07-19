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
    
    let videosService = VideosNetworkService()
    var responceVideos = [(title: String, channelId: String, previewImage: String)]()
    let videoIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videosService.loadVideosData() { [weak self]
            responce in
            
            responce.forEach() { video in
                if let id = video.id.videoId {
                    let videoInfo = (video.snippet.title, id, video.snippet.thumbnails.high.url)
                    self?.responceVideos.append(videoInfo)
                }
            }
            self?.videosTableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showVideo" {
            if let indexPath = videosTableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! PlayVideoViewController
                destinationController.videoId = responceVideos[indexPath.row].channelId
            }
        }
    }
}

extension VideosViewController: UITableViewDataSource  {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responceVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        
        
        cell.videoNameLabel.text = self.responceVideos[indexPath.row].title
        
        if let imageURL = URL(string: self.responceVideos[indexPath.row].previewImage) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.previewImage.image = image
                    }
                }
            }
        }
        return cell
    }
}
