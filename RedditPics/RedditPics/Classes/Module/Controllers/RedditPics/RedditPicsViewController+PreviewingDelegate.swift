//
//  RedditPicsViewController+PreviewingDelegate.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 28/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import UIKit

extension RedditPicsViewController: UIViewControllerPreviewingDelegate {
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {}
    
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        if let indexPath = collectionView.indexPathForItem(at: location), let cellAttributes = collectionView.layoutAttributesForItem(at: indexPath),
            let previewImageString = redditViewModel.data[indexPath.row].url {
            previewingContext.sourceRect = cellAttributes.frame
            let previewVC = RedditPicsPreviewViewController(imageString: previewImageString)
            previewVC.preferredContentSize = cellAttributes.frame.size
            return previewVC
        }
        return nil
    }
    
}
