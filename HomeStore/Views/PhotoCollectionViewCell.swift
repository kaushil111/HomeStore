//
//  PhotoCollectionViewCell.swift
//  HomeStore
//
//  Created by Kaushil Ruparelia on 8/15/17.
//  Copyright © 2017 Kaushil Ruparelia. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var cost: UILabel!
    
    override func awakeFromNib() {
        setShadow()
    }
    
    func setShadow()  {
        
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 1.0
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false
    }
    
    override func prepareForReuse() {
        imageView.image = nil
        title.text = ""
        cost.text = ""
    }
}
