//
//  VideosViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit

class VideosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var videosTableView: UITableView!
    
    let videosService = VideosNetworkService()
    var responceVideos = [(title: String, channelId: String, previewImage: String)]()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responceVideos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "VideoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! VideosCell
        
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
//        let videoCode = self.responceVideos[indexPath.row].channelId
//
//        let myURL = URL(string: "https://www.youtube.com/embed/\(videoCode)")
//        let youtubeRequest = URLRequest(url: myURL!)
//        cell.videoWKWebView.load(youtubeRequest)

        
        return cell
    }
}
