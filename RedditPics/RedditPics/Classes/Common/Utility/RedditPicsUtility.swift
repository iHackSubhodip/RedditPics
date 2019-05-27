//
//  RedditPicsUtility.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import UIKit

extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

extension UIFont {
    static func regular(_ size : CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .regular)
    }
    
    static func semiBold(_ size : CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .semibold)
    }
    
    static func light(_ size : CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size, weight: .light)
    }
}
