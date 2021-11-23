//
//  UIImageView+Nasa.swift
//  Nasa
//
//  Created by Angie Mugo on 22/11/2021.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()
var imageURL: URL?

extension UIImageView {
    func loadImage(_ url: URL) {
        imageURL = url
        image = nil 
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }

        URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("This is the error: \(error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                if let data = data, let imageToCache = UIImage(data: data) {
                    if imageURL == url {
                        self.image = imageToCache
                    }
                    imageCache.setObject(imageToCache, forKey: url as AnyObject)
                }
            }
        }).resume()
    }
}
