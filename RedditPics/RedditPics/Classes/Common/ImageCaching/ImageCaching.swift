//
//  ImageCaching.swift
//  RedditPics
//
//  Created by Banerjee,Subhodip on 27/05/19.
//  Copyright © 2019 Banerjee,Subhodip. All rights reserved.
//

import Foundation

class ImageCaching<Keys: AnyObject, Values: AnyObject>: NSCache<AnyObject, AnyObject> {
    let maxCachedObjects: Int
    var keyList: [Keys]
    var keyListIndex = 0
    
    init(cacheLimit: Int = 100) {
        maxCachedObjects = cacheLimit
        keyList = [Keys]()
        super.init()
        keyList.reserveCapacity(maxCachedObjects)
    }
    
    
    func setObject(_ obj: Values, forKey key: Keys) {
        if keyList.count == maxCachedObjects {
            removeObject(forKey: keyList[keyListIndex])
            keyList[keyListIndex] = key
            keyListIndex = keyListIndex + 1 == keyList.count ? 0 : keyListIndex + 1
        } else {
            keyList.append(key)
        }
        super.setObject(obj, forKey: key)
    }
    
    
    func getObject(forKey key: AnyObject) -> Values? {
        return super.object(forKey: key) as? Values
    }
}
