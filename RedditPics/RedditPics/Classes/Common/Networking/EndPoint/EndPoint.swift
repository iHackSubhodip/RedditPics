//
//  EndPoint.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import Foundation

enum EndPoints{
    
    enum RedditPicsEndPoint: EndPoint{
        case fetch
        
        var path: String{
            switch self{
            case .fetch:
                return API.getPicsURL
            }
        }
    }
}
