//
//  DataModel.swift
//  HomeStore
//
//  Created by Kaushil Ruparelia on 8/15/17.
//  Copyright © 2017 Kaushil Ruparelia. All rights reserved.
//

import UIKit


class DataModel {
    //Create a singleton of the shared instance
    var searchString = "Nature"
    var perPage = "20"
    private let API_KEY = "489386ece92b660c8eef44bf589ed379"

    init() {
        
    }
    
    func getPhotos(completionHandler: @escaping (Array<Photo>) -> Swift.Void)  {
        
        
        let URLString = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=\(self.API_KEY)&text=\(self.searchString)&per_page=\(self.perPage)&format=json&nojsoncallback=1"
        
        let taskURL = URL(string: URLString)
        
        let task = URLSession.shared.dataTask(with: taskURL!, completionHandler: { (data, response, error) in
            var photoArray = Array<Photo>()
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableLeaves) as! Dictionary<String, Any>
                
                let photosDictionary = json["photos"] as! Dictionary<String, Any>
                
                for photo in (photosDictionary["photo"] as! Array<Dictionary<String, Any>>) {
                    photoArray.append(Photo(dictionary: photo))
                }
                
                completionHandler(photoArray)
            }
            catch {
                print(error)
                
            }
        })
        
        task.resume()
    }
}
