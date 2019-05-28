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
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        registerCollectionViewCells()
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func registerCollectionViewCells(){
        collectionView.register(RedditPicsCollectionViewCell.self, forCellWithReuseIdentifier: CellIdentifier.collectionViewCell)
    }
    
    func configureNavigationBar() {
        self.navigationItem.title = "Reddit Images"
    }
    
    func makeAPICall(){
        guard checkInternetConnectivity() else {
            print("No Internet Connectivity")
            return
        }
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
