//
//  RedditPicsUtility.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import UIKit
import SystemConfiguration

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

extension UIImageView {
    
    func downloadImage(url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit, width: CGFloat? = nil, downloadFinished: (()->())? = nil) {
        contentMode = mode
        let imageCache = AppDelegate.imageCache
        
        if let cachedImage = imageCache.getObject(forKey: url.absoluteString as NSString) {
            DispatchQueue.main.async() {
                self.image = cachedImage
                downloadFinished?()
            }
        } else {
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    var image = UIImage(data: data)
                    else {
                        DispatchQueue.main.async() {
                            downloadFinished?()
                        }
                        return
                }
                if let newWidth = width, let newImage = self.resizeImage(image: image, newWidth: newWidth) {
                    image = newImage
                }
                imageCache.setObject(image, forKey: url.absoluteString as NSString)
                DispatchQueue.main.async() {
                    self.image = image
                    downloadFinished?()
                }
                }.resume()
        }
    }
    
    
    func downloadImage(link: String?, contentMode mode: UIView.ContentMode = .scaleAspectFit, width: CGFloat? = nil, downloadFinished: (()->())? = nil) {
        guard let urlString = link, let url = URL(string: urlString) else { return }
        downloadImage(url: url, contentMode: mode, width: width, downloadFinished: downloadFinished)
    }
    
    
    private func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage? {
        defer {
            UIGraphicsEndImageContext()
        }
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        return newImage
    }
}

extension UIViewController{
    
    func checkInternetConnectivity() -> Bool {
        
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
                SCNetworkReachabilityCreateWithAddress(nil, $0)
            }
        }) else {
            return false
        }
        
        var flags : SCNetworkReachabilityFlags = []
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
            return false
        }
        
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        
        return (isReachable && !needsConnection)
    }
}
