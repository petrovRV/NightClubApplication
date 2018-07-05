//
//  VideosViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit
class VideosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    
    @IBOutlet weak var VideosTableView: UITableView!
    
    let videosService = VideosNetworkService()
    var responceVideos = [Items]()
    var videosIds = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        videosService.loadVideosData() { [weak self]
            responce in
            
            responce.forEach() { video in
                if let id = video.id.videoId {
                    self?.videosIds.append(id)
                }
//                self?.VideosTableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "VideoCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! VideosCell
        
        cell.videoNameLabel.text = "VideoName raz dwa trzy"
        let myURL = URL(string: "https://www.youtube.com/embed/RmHqOSrkZnk")
        var youtubeRequest = URLRequest(url: myURL!)
        cell.videoWKWebView.load(youtubeRequest)
        
        return cell
    }
}
