//
//  ImageLoader.swift
//  ShanmugaPriya-SwiftUI-Project
//
//  Created by Shanmuga Priya M on 16/10/23.
//

import SwiftUI
class ImageLoader{
    var queue = OperationQueue()
    var cache = NSCache<NSString, UIImage>()
    
    func downloadImageFrom(_ imageURL: String, completion:@escaping((UIImage)->()))
    {
        if let image = cache.object(forKey: imageURL as NSString){
            completion(image)
            return
        }
        queue.addOperation{[weak self] in
            if let imageData = try? Data(contentsOf: URL(string: imageURL)!) {
                let image = UIImage(data: imageData)!
                self?.cache.setObject(image, forKey: imageURL as NSString)
                OperationQueue.main.addOperation{
                    completion(image)
                }
            }
            else{
                completion(UIImage(named: "login")!)
            }
        }
    }
}
