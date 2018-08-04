//
//  SocialURLs.swift
//  Night_Club_Application
//
//  Created by Lubomir Olshansky on 04/08/2018.
//  Copyright © 2018 Lubomir Olshansky. All rights reserved.
//

import Foundation

enum SocialURL {
    
    case instagram
    case facebook
    
    func getAppURL() -> URL {
        
        switch self {
        case .instagram:
            return URL(string: "instagram://user?screen_name=xoxopartyclub")!
        case .facebook:
            return URL(string: "facebook://user?screen_name=XOXOPARTY")!
        }
    }
    
    func getWebURL() -> URL {
        
        switch self {
        case .instagram:
            return URL(string: "https://instagram.com/xoxopartyclub")!
        case .facebook:
            return URL(string: "https://facebook.com/XOXOPARTY")!
        }
    }
}
