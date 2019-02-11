//
//  ImageDetailViewController.swift
//  ZoloAssignment
//
//  Created by Mayank on 11/02/19.
//  Copyright © 2019 Mayank. All rights reserved.
//

import UIKit

class ImageDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    static func viewController(with data: DataModel) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let imageDetailVc = storyBoard.instantiateViewController(withIdentifier: "imageDetailVc") as! ImageDetailViewController
        return imageDetailVc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func appreciateButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
