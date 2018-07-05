//
//  VideosCell.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 05/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit
import WebKit

class VideosCell: UITableViewCell {

    @IBOutlet weak var videoWKWebView: WKWebView!
    @IBOutlet weak var videoNameLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
