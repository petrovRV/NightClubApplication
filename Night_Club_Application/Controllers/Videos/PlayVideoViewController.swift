//
//  PlayVideoViewController.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 11/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit
import WebKit

class PlayVideoViewController: UIViewController, WKNavigationDelegate {

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var videoWebView: WKWebView!
    
    var videoId: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareAction))
        self.navigationItem.rightBarButtonItem = shareButton
            
            
            
            
        self.activityIndicator.startAnimating()
        self.videoWebView.navigationDelegate = self
        self.activityIndicator.hidesWhenStopped = true
        loadYoutubeVideo()
        
    }
    @objc func shareAction() {
     
        let shareLink = "www.youtube.com/watch?v=\(self.videoId)"
        let activityViewController = UIActivityViewController(activityItems: [shareLink], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    
    private func loadYoutubeVideo() {
    let videoCode = self.videoId
    let myURL = URL(string: "https://www.youtube.com/embed/\(videoCode)")
    let youtubeRequest = URLRequest(url: myURL!)
    videoWebView.load(youtubeRequest)
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }

}
