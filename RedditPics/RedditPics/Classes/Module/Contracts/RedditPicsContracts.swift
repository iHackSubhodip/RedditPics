//
//  RedditPicsContracts.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import Foundation

protocol RedditPicsVCInput: class{
    var redditViewModel: RedditPicsViewModel { get set }
}

protocol RedditPicsVCOutput: class{
    func loadNewPage(_ firstTimeLoading: Bool)
}
