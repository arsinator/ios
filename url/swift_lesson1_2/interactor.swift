//
//  interactor.swift
//  swift_lesson1_2
//
//  Created by Арсений Ермилов   on 29/10/2019.
//  Copyright © 2019 16817252. All rights reserved.
//

import UIKit

class interactor: NSObject , presenTorToInterectorProtocol {
    
    var presenter : interactorToPresenterProtocol?
    func download(completion: @escaping (UIImage?, Error?) -> Void) {
        guard let url = URL(string:"https://cdn.designcrowd.com/blog/2016/May/instagram-logo-redesign/Instagram%20logo.jpg") else { return }
        let cache = URLCache.shared
        let request = URLRequest(url: url)
        if let data = cache.cachedResponse(for: request)?.data , let image = UIImage(data: data) {
            print(image)
            print("cache hit")
            completion(image, nil)
            return
        }
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print(response)
            if let currentError = error {
                completion(nil, currentError)
                return
            }
            
            guard let currentData = data else { return }
            let cachedData = CachedURLResponse(response: response!, data: data!)
            cache.storeCachedResponse(cachedData, for: request)
            let image = UIImage(data: currentData)
            
            completion(image, nil)
        }
        
        task.resume()
    }
    func downloadImage() {
        download { imagee, error in
            DispatchQueue.main.async {
                self.presenter?.parseImage(image: imagee!)
            }
        }
    }
    func invalidateCache(){
        URLCache.shared.removeAllCachedResponses()
    }
    
    
    

}
