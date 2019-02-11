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
    private var data: DataModel?
    private var mainImageURL: String?
    
    static func viewController(with data: DataModel, image: String) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let imageDetailVc = storyBoard.instantiateViewController(withIdentifier: "imageDetailVc") as! ImageDetailViewController
        imageDetailVc.data = data
        imageDetailVc.mainImageURL = image
        return imageDetailVc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        if let title = data?.title, let body = data?.body, let imageURL = mainImageURL {
            titleLabel.text = title
            bodyLabel.text = body
            DataModel.getImage(fromUrl: imageURL) { image in
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        }
    }
    
    @IBAction func appreciateButtonPressed(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
