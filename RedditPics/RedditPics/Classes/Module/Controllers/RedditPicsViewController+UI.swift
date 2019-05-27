//
//  RedditPicsViewController+UI.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import UIKit

extension RedditPicsViewController{
    
    func configureCollectionView() {
        view.addSubview(collectionView)
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        collectionView.backgroundColor = UIColor.rgb(red: 246, green: 247, blue: 248, alpha: 0.5)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RedditPicsCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.collectionViewCell)
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = "Reddit Images"
    }
    
    func makeAPICall(){
        guard let output = controllerOutput else { return }
        output.loadNewPage(true)
    }
    
    func reloadCollectionViewData() {
        DispatchQueue.main.async { [weak self] in
            guard let selfObject = self else { return }
            UIView.performWithoutAnimation {
                selfObject.collectionView.reloadData()
            }
        }
    }
}
