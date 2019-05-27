//
//  RedditPicsEntity.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import Foundation

enum RedditPicsEntityState {
    case loading
    case done
}

struct RedditPicsEntity {
    var state: RedditPicsEntityState
    var posts: [ChildrenData]
}
