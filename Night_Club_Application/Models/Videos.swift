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
}
struct Id: Decodable {
    let videoId: String?
}
