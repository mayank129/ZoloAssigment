//
//  ImageCache.swift
//  ZoloAssignment
//
//  Created by Mayank on 11/02/19.
//  Copyright © 2019 Mayank. All rights reserved.
//

import UIKit

let imageCache = ImageCache()

class ImageCache: NSCache<AnyObject, AnyObject> {
    func addImage(_ image: UIImage, key: String) {
        setObject(image, forKey: key as AnyObject)
    }
    
    func getImge(forKey key: String) -> UIImage? {
        guard let image = object(forKey: key as AnyObject) as? UIImage else {
            return nil
        }
        return image
    }
}
