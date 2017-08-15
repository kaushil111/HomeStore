//
//  Photo.swift
//  HomeStore
//
//  Created by Kaushil Ruparelia on 8/15/17.
//  Copyright © 2017 Kaushil Ruparelia. All rights reserved.
//

import UIKit



class Photo {
    var id = ""
    var title = ""
    var serverID = ""
    var farmID = ""
    var secret = ""
    var imgURL = ""
    var cost = ""
    
    static let size = "q"
    static let photoType = "jpg"
    
    convenience init(dictionary: Dictionary<String, Any>) {
        
        self.init(id: "\(dictionary["id"] ?? "")",
                  title: "\(dictionary["title"] ?? "")",
            serverID: "\(dictionary["server"] ?? "")",
            farmID: "\(dictionary["farm"] ?? "")",
            secret: "\(dictionary["secret"] ?? "")")
        
    }
    
    init(id: String, title: String, serverID: String, farmID: String, secret: String ) {
        
        self.id = id
        self.title = title
        self.serverID = serverID
        self.farmID = farmID
        self.secret = secret
        
        cost = "\(arc4random_uniform(300))"
        
        self.imgURL = getImgURL()
        
    }
    
    
    
    
    private func getImgURL() -> String {
        return "https://farm\(farmID).staticflickr.com/\(serverID)/\(id)_\(secret)_\(Photo.size).\(Photo.photoType)"
    }
    
    func setImage(completionHandler: @escaping (_ data: Data) -> Swift.Void) {
        URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, response, error) in
            completionHandler(data!)
        }.resume()
    }
}
