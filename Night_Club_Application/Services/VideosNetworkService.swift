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
    
    typealias loadVideosDataCompletion = ([Items]) -> Void
    
    var environment: Environment {
        return EnvironmentImp.Debug()
    }

    func loadVideosData(completion: @escaping loadVideosDataCompletion ){
        
        let path = "/youtube/v3/search"
        let parameters: Parameters = [
            "part": "snippet",
            "channelId": self.environment.channelId,
            "key": self.environment.apiKey
        ]
        let url = self.environment.baseUrl + path

        Alamofire.request(url, method: .get, parameters: parameters).responseJSON(queue: .global(qos: .userInteractive))
            { respons in
            guard let data = respons.data else {return}
            
            do {
                let videosDecoded = try JSONDecoder().decode(Videos.self, from: data)
                DispatchQueue.main.async {
                    completion(videosDecoded.items)
                    return
                }
        } catch let jsonErr {
            print("Error serializing json:", jsonErr)
            }
        }
    }
}
