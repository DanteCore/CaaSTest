//
//  CustomCollectionViewLayout.swift
//  CustomCollectionLayout
//
//  Created by JOSE MARTINEZ on 15/12/2014.
//  Copyright (c) 2014 brightec. All rights reserved.
//

import UIKit

class CustomCollectionViewLayout: UICollectionViewLayout {
    
    var itemAttributes : NSMutableArray!
    var itemsSize : NSMutableArray!
    var contentSize : CGSize!
    
    override func prepareLayout() {
        if collectionView?.numberOfSections() == 0 {
            return
        }
        
        let numberOfColumns = collectionView?.dataSource?.collectionView(collectionView!, numberOfItemsInSection: 0)
        
        if itemAttributes != nil && itemAttributes.count > 0 {
            for section in 0..<collectionView!.numberOfSections() {
                
                for index in 0..<collectionView!.numberOfItemsInSection(section) {
                    if index == 0 {
                        let attributes = layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: index, inSection: section))
                        var frame = attributes.frame
                        frame.origin.x = collectionView!.contentOffset.x
                        attributes.frame = frame
                    } else {
                        continue
                    }
                }
            }
            return
        }
        
        if itemsSize == nil || itemsSize.count != numberOfColumns {
            calculateItemsSize()
        }
        
        var column = 0
        var xOffset : CGFloat = 0
        var yOffset : CGFloat = collectionView!.contentOffset.y
        var contentWidth : CGFloat = 0
        var contentHeight : CGFloat = 0
        
        for section in 0..<collectionView!.numberOfSections() {
            let sectionAttributes = NSMutableArray()
            
            let numberOfColumns = collectionView!.dataSource!.collectionView(collectionView!, numberOfItemsInSection: 0)
            
            for index in 0..<numberOfColumns {
                let itemSize = itemsSize[index].CGSizeValue()
                let indexPath = NSIndexPath(forItem: index, inSection: section)
                let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
                attributes.frame = CGRectIntegral(CGRectMake(xOffset, yOffset, itemSize.width, itemSize.height))
                
                if index == 0 {
                    attributes.zIndex = 1;
                    var frame = attributes.frame
                    frame.origin.x = collectionView!.contentOffset.x
                    attributes.frame = frame
                }
                
                sectionAttributes.addObject(attributes)
                
                xOffset += itemSize.width
                column++
                
                if column == numberOfColumns {
                    if xOffset > contentWidth {
                        contentWidth = xOffset
                    }
                    column = 0
                    xOffset = 0
                    yOffset += itemSize.height
                }
            }
            if itemAttributes == nil {
                itemAttributes = NSMutableArray(capacity: collectionView!.numberOfSections())
            }
            itemAttributes.addObject(sectionAttributes)
        }
        
        let attributes = itemAttributes.lastObject?.lastObject as! UICollectionViewLayoutAttributes
        contentHeight = attributes.frame.origin.y + attributes.frame.size.height
        contentSize = CGSizeMake(contentWidth, contentHeight)
    }
    
    override func collectionViewContentSize() -> CGSize {
        return contentSize
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> (UICollectionViewLayoutAttributes!) {
        return itemAttributes[indexPath.section][indexPath.row] as! UICollectionViewLayoutAttributes
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var attributes = [UICollectionViewLayoutAttributes]()
        if itemAttributes != nil {
            for section in itemAttributes {
                
                let filteredArray = section.filteredArrayUsingPredicate(
                    
                    NSPredicate(block: { (evaluatedObject, bindings) -> Bool in
                        return CGRectIntersectsRect(rect, evaluatedObject.frame)
                    })
                    ) as! [UICollectionViewLayoutAttributes]
                
                attributes.appendContentsOf(filteredArray)
            }
        }
        return attributes
    }
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }
    
    func sizeForItemWithColumnIndex(columnIndex: Int) -> CGSize {
        return CGSizeMake(collectionView!.frame.width/4, 60)
    }
    
    func calculateItemsSize() {
        
        let numberOfColumns = collectionView!.dataSource!.collectionView(collectionView!, numberOfItemsInSection: 0)
        itemsSize = NSMutableArray(capacity: numberOfColumns)
        for index in 0..<numberOfColumns {
            itemsSize.addObject(NSValue(CGSize: sizeForItemWithColumnIndex(index)))
        }
    }
}