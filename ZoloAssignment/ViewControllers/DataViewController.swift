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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHeaderCollectionView()
        setupPrimaryCollectionView()
    }
    
    private func setupHeaderCollectionView() {
        headerCollectionView.delegate = self
        headerCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
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
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width*0.4 , height: primaryCollectionView.frame.size.height)
        primaryCollectionView.collectionViewLayout = layout
        DataModel.getData(withUrl: "https://jsonplaceholder.typicode.com/posts") { [weak self] data in
            guard let strongSelf = self else {
                return
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == headerCollectionView {
            return headerData.count
        }
        else {
            return 0
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
            return UICollectionViewCell()
        }
    }
    
}
