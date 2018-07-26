//
//  Environment.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 05/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import Foundation


import Foundation

protocol Environment {
    var apiKey: String { get }
    var channelId: String { get }
    var baseUrl: String { get }

}

struct EnvironmentImp {
    private init(){}
}

extension EnvironmentImp {
    
    struct Debug: Environment {
        let apiKey = "AIzaSyAfsBcF5oRVZ1gaDDMAht_aAk-CQR-9s3Q"
        let channelId = "UCwkfbdM_Evl9k0sBZ1uA44w"
        let baseUrl = "https://www.googleapis.com"
    }
}
