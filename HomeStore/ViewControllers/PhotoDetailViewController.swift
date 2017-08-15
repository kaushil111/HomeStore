//
//  PhotoDetailViewController.swift
//  HomeStore
//
//  Created by Kaushil Ruparelia on 8/15/17.
//  Copyright © 2017 Kaushil Ruparelia. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    var photo : Photo?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoTitle: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var photoDescription: UITextView!
    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var activityView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setTitle()
        setData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Initial Setup
    
    func setTitle() {
        self.navigationItem.titleView = UIImageView(image: UIImage(named: "Logo"))
    }
    
    func setData() {
        activityView.isHidden = false
        photo?.setLargeImage(completionHandler: { (data) in
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
                self.activityView.isHidden = true
            }
        })
        photoTitle.text = photo?.title
        cost.text = "$" +
            (photo?.cost)!
        
        
    }
    
    //MARK: Status Bar
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func addToCartTapped(_ sender: Any) {
        
        
        
    }
}
