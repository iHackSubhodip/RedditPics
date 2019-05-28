//
//  RedditPicsPreviewViewController+UI.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 28/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import UIKit

extension RedditPicsPreviewViewController{
    
    func setupView(){
        view.addSubview(previewImageView)
        previewImageView.downloadImage(link: imageString, contentMode: .scaleAspectFit, width: self.view.frame.size.width) { [weak self] in
            guard let selfObject = self else { return }
            selfObject.preferredContentSize = selfObject.previewImageView.image?.size ?? .zero
        }
    }
    
    func setupConstriant(){
        previewImageView.anchors(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}
