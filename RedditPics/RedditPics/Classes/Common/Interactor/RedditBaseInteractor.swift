//
//  RedditBaseInteractor.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import Foundation

class RedditBaseInteractor {
    let webService: NetworkingWebService
    
    init(webService: NetworkingWebService) {
        self.webService = webService
    }
}
