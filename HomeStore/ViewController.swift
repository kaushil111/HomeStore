//
//  ViewController.swift
//  HomeStore
//
//  Created by Kaushil Ruparelia on 8/14/17.
//  Copyright © 2017 Kaushil Ruparelia. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let dataCtrl = PhotosDataController()

    @IBOutlet weak var photosCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setTitle()
        fetchPhotos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setTitle() {
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Logo"))
    }
    
    func fetchPhotos() {
        dataCtrl.dataModel.getPhotos { (photos) in
            self.dataCtrl.listOfPhotos = photos
             DispatchQueue.main.async {
                self.photosCollectionView.reloadData()
            }
        }
    }
    
    
    //MARK: Collection Data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: self.view.bounds.size.width/2 - 15 , height: self.view.bounds.size.width/2 + 70)
        
        return dataCtrl.listOfPhotos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photosCell", for: indexPath) as! PhotoCollectionViewCell
        
        let photo = dataCtrl.listOfPhotos[indexPath.row]
        
        cell.title.text = photo.title
        cell.cost.text = "$" + photo.cost
        
        photo.setImage { (data) in
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: data)
            }
        }
        
        return cell
    }
    
    
    
    //MARK: Status Bar
    
    override var prefersStatusBarHidden: Bool {
        return true
    }


}

