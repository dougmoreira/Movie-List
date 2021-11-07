//
//  UIImageView+Extensions.swift
//  MovieList
//
//  Created by douglas.fernandes on 07/11/21.
//

import UIKit

class CustomImageView: UIImageView {
    
    let imageCache = NSCache<NSString, UIImage>()
    var imageURL: String?

    func load(url: URL) {
        self.image = nil
        imageURL = url.path
        if let cachedImage = imageCache.object(forKey: url.path as NSString) {
            DispatchQueue.main.async {
                self.image = cachedImage
            }
        } else {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        self?.imageCache.setObject(image, forKey: url.path as NSString)
                        DispatchQueue.main.async {
                            if self?.imageURL == url.path {
                                self?.image = image
                            }
                            
                        }
                    }
                }
            }
        }
    }
}
