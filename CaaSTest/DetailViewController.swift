//
//  DetailViewController.swift
//  CaaSTest
//
//  Created by Serhii Onopriienko on 1/20/16.
//  Copyright © 2016 Edsson. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    var scrollItem = 0

    
    let dataSource = CashPointDataSource()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.layer.cornerRadius = 7.0
        collectionView.registerNib(UINib(nibName: CashPointSectionCell.identifier, bundle: nil), forCellWithReuseIdentifier: CashPointSectionCell.identifier)
        collectionView.registerNib(UINib(nibName: CashPointTextCell.identifier, bundle: nil), forCellWithReuseIdentifier: CashPointTextCell.identifier)
        collectionView.registerNib(UINib(nibName: CashPointImageCell.identifier, bundle: nil), forCellWithReuseIdentifier: CashPointImageCell.identifier)
      
        collectionView.delegate = self
        collectionView.dataSource = dataSource
        
        collectionViewHeightConstraint.constant = 600
        
    }
    
    @IBAction func next(sender: AnyObject) {
        

        let visibleItems = collectionView.indexPathsForVisibleItems()
        let currentItem = visibleItems[0]
        let nextItem = NSIndexPath(forItem: (currentItem.row + 1), inSection: currentItem.section)

        
        scrollItem = scrollItem+2
        collectionView.scrollToItemAtIndexPath(nextItem, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
    }
    
    @IBAction func prev(sender: AnyObject) {
        
        scrollItem--
        collectionView.scrollToItemAtIndexPath(NSIndexPath(forItem: scrollItem, inSection: 1), atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
    }
}


extension DetailViewController: UICollectionViewDelegate {
    
}
