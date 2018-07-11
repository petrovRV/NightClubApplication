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
    var videoURL: String = ""
    @IBOutlet weak var videoWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


                let videoCode = self.videoURL
        
                let myURL = URL(string: "https://www.youtube.com/embed/\(videoCode)")
                let youtubeRequest = URLRequest(url: myURL!)
                videoWebView.load(youtubeRequest)
        
        self.activityIndicator.startAnimating()
        self.videoWebView.navigationDelegate = self
        self.activityIndicator.hidesWhenStopped = true
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
    }

}
