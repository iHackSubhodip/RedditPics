//
//  RedditPicsCollectionViewCell.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import UIKit

class RedditPicsCollectionViewCell: UICollectionViewCell {
    
    lazy var redditLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17.0)
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    lazy var redditImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = #imageLiteral(resourceName: "photo_placeholder")
        return imageView
    }()
    
    private func redditCellSetup(){
        addSubview(redditLabel)
        addSubview(redditImageView)
    }
    
    private func redditCellLayoutCetup(){
        redditImageView.anchors(top: safeAreaLayoutGuide.topAnchor, topConstants: 10, leading: safeAreaLayoutGuide.leadingAnchor, leadingConstants: 10, bottom: safeAreaLayoutGuide.bottomAnchor, bottomConstants: 10, widthConstants: 130)
        redditLabel.anchors(top: safeAreaLayoutGuide.topAnchor, topConstants: 10, leading: redditImageView.trailingAnchor, leadingConstants: 10, bottom: safeAreaLayoutGuide.bottomAnchor, bottomConstants: 10, trailing: safeAreaLayoutGuide.trailingAnchor, trailingConstants: -10)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        redditCellSetup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        redditCellLayoutCetup()
    }
    
    override func prepareForReuse() {
        redditLabel.text = ""
        redditImageView.image = #imageLiteral(resourceName: "photo_placeholder")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

}

extension RedditPicsCollectionViewCell{
    
    func applyToCell(withModel: ChildrenData){
        redditImageView.downloadImage(link: withModel.thumbnail)
        redditLabel.text = withModel.title
    }
    
}
