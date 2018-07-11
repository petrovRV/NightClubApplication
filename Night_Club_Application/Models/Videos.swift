//
//  Videos.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import Foundation

struct Videos: Decodable {
    
    let items: [Items]
}
struct Items: Decodable {
    let id: Id
    let snippet: Snippet
}
struct Id: Decodable {
    let videoId: String?
}
struct Snippet: Decodable {
    let title: String
    let thumbnails: Thumbnails
}

struct Thumbnails: Decodable {
    let high: High
}
struct High: Decodable {
    let url: String
}


