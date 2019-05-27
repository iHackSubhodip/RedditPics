//
//  RedditPicsViewController+CollectionView.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import UIKit

extension RedditPicsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.collectionViewCell, for: indexPath) as? RedditPicsCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return redditViewModel.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == redditViewModel.data.count - 3 {
            controllerOutput?.loadNewPage(false)
        }
    }
}

extension RedditPicsViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath) // do tapping check
    }
}


extension RedditPicsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width - 20,
                      height: UIScreen.main.bounds.width * 150 / 400)
    }
}
