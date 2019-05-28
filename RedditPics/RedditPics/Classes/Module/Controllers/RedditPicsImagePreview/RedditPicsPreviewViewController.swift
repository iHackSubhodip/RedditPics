//
//  RedditPicsPreviewViewController.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 28/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import UIKit

class RedditPicsPreviewViewController: UIViewController {

    var imageString: String
    lazy var previewImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10.0
        return imageView
    }()
    
    
    init(imageString: String){
       self.imageString = imageString
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstriant()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
