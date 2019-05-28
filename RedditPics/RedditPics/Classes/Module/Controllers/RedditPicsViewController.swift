//
//  RedditPicsViewController.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import UIKit

class RedditPicsViewController: UIViewController, RedditPicsVCInput{

    var collectionView: UICollectionView!
    var controllerOutput: RedditPicsVCOutput?
    
    var redditViewModel: RedditPicsViewModel = RedditPicsViewModel(data: []) {
        didSet {
            reloadCollectionViewData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        makeAPICall()
        configureCollectionView()
    }
    
    
}
