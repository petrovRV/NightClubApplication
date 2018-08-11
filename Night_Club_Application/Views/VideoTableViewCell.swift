//
//  VideosCell.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 05/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit
import WebKit

class VideoTableViewCell: UITableViewCell {


    @IBOutlet weak var previewImage: UIImageView!
    @IBOutlet weak var videoNameLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setPreviewAndName(with item: Items) {
        
        videoNameLabel.text = item.snippet.title
        
        if let imageURL = URL(string: item.snippet.thumbnails.high.url) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.previewImage.image = image
                    }
                }
            }
        }
    }
}
