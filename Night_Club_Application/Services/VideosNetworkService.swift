//
//  VideosNetworkService .swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/07/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import UIKit
import Foundation
import Alamofire

class VideosNetworkService {
    
    typealias loadVideosDataCompletion = ([Videos]) -> Void
    
    let baseUrl = "https://www.googleapis.com"
    let apiKey = "AIzaSyAfsBcF5oRVZ1gaDDMAht_aAk-CQR-9s3Q"
    let channelId = "UCEJNQ2nuAA-R9vpPZ22Y2Cg"
    
    func loadVideosData(completion: @escaping loadVideosDataCompletion ){
        
        let path = "/youtube/v3/search"
        let parameters: Parameters = [
            "part": "snippet",
            "channelId": channelId,
            "key": apiKey
        ]
        let url = baseUrl + path

        Alamofire.request(url, method: .get, parameters: parameters).responseJSON
            { respons in
            guard let data = respons.data else {return}
            
            do {
                let videosDecoded = try JSONDecoder().decode(Videos.self, from: data)
                completion([videosDecoded])
            return
        } catch let jsonErr {
            print("Error serializing json:", jsonErr)
            }
        }
    }
}
