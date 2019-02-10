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
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width*(4/3) , height: headerCollectionView.frame.size.height)
        headerCollectionView.collectionViewLayout = layout
        DataModel.getData(withUrl: "https://jsonplaceholder.typicode.com") { [weak self] data in
            guard let strongSelf = self else {
                return
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
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}
