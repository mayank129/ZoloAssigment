//
//  DataViewController.swift
//  ZoloAssignment
//
//  Created by Mayank on 10/02/19.
//  Copyright © 2019 Mayank. All rights reserved.
//

import UIKit

class DataViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var headerCollectionView: UICollectionView!
    @IBOutlet weak var primaryCollectionView: UICollectionView!
    private var headerData = [DataModel]()
    private var primaryData = [DataModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderCollectionView()
        setupPrimaryCollectionView()
    }
    
    private func setupHeaderCollectionView() {
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width*(3/4) , height: headerCollectionView.frame.size.height)
        headerCollectionView.collectionViewLayout = layout
        DataModel.getData(withUrl: "https://jsonplaceholder.typicode.com/todos") { [weak self] data in
            guard let strongSelf = self else {
                return
            }
            strongSelf.headerData = data
            DispatchQueue.main.async {
                strongSelf.headerCollectionView.reloadData()
            }
        }
    }
    
    private func setupPrimaryCollectionView() {
        primaryCollectionView.delegate = self
        primaryCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 5
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width*0.4 , height: primaryCollectionView.frame.size.height)
        primaryCollectionView.collectionViewLayout = layout
        DataModel.getData(withUrl: "https://jsonplaceholder.typicode.com/posts") { [weak self] data in
            guard let strongSelf = self else {
                return
            }
            strongSelf.primaryData = data
            DispatchQueue.main.async {
                strongSelf.primaryCollectionView.reloadData()
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == headerCollectionView {
            return headerData.count
        }
        else {
            return primaryData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == headerCollectionView {
            let headerCell = headerCollectionView.dequeueReusableCell(withReuseIdentifier: "HeaderCollectionViewCell", for: indexPath) as! HeaderCollectionViewCell
            if let text = headerData[indexPath.item].title {
                headerCell.textLabel.text = text
            }
            return headerCell
        }
        else {
            let primaryCell = primaryCollectionView.dequeueReusableCell(withReuseIdentifier: "PrimaryCollectionViewCell", for: indexPath) as! PrimaryCollectionViewCell
            if let body = primaryData[indexPath.item].body {
                primaryCell.textLabel.text = body
            }
            DataModel.getImage(fromUrl: "https://homepages.cae.wisc.edu/~ece533/images/watch.png") { image in
                DispatchQueue.main.async {
                    primaryCell.imageView.image = image
                }
            }
            return primaryCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == primaryCollectionView {
            let imageDetailVc = ImageDetailViewController.viewController(with: primaryData[indexPath.item])
            navigationController?.pushViewController(imageDetailVc, animated: true)
        }
    }
    
}
