//
//  VideosDetail.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 20/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import Foundation

struct VideosDetail: Decodable {
    
    let items: [ItemsDetail]
}

struct ItemsDetail: Decodable {
    let contentDetails: ContentDetails
    let statistics: Statistics
}

struct ContentDetails: Decodable {
    let duration: String

}

struct Statistics: Decodable {
    let viewCount: String
}
