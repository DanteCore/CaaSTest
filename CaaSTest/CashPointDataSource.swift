//
//  CashPointDataSource.swift
//  CaaSTest
//
//  Created by Serhii Onopriienko on 1/21/16.
//  Copyright © 2016 Edsson. All rights reserved.
//

import Foundation
import UIKit

struct CashPointSectionSource {
    static func sections() -> [(name:String, image:UIImage)] {
        return [
            ("Location code",        UIImage(named: "cash_section")!),
            ("Location name",        UIImage(named: "cash_section")!),
            ("Address",              UIImage(named: "cash_section")!),
            ("Cash point type",      UIImage(named: "cash_section")!),
            ("Technical state",      UIImage(named: "cash_section")!),
            ("Cash state",           UIImage(named: "cash_section")!),
            ("Current amount",       UIImage(named: "cash_section")!),
            ("Last collection",      UIImage(named: "cash_section")!),
            ("Next collection",      UIImage(named: "cash_section")!),
            ("Change order planned", UIImage(named: "cash_section")!)
        ]
    }
}

class CashPointDataSource: NSObject, UICollectionViewDataSource {
    
    let data = [CashPoint]()
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return CashPointSectionSource.sections().count
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cashPoint = CashPoint()
        
        switch indexPath.section {
        case 1: return locationCodeRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        case 2: return locationNameRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        case 3: return addressRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        case 4: return cashPointTypeRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        case 5: return technicalStateRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        case 6: return cashStateRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        case 7: return currentAmountRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        case 8: return locationCollectionRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        case 9: return nextCollectionRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        case 10: return changeOrderPlannedRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        default: return locationCodeRow(indexPath, collectionView: collectionView, chashPoint: cashPoint)
        }
    }
    
    func sectionCellForIndexPath(indexPath: NSIndexPath, inCollectionView collectionView: UICollectionView) -> UICollectionViewCell {
        let sectionCell : CashPointSectionCell = collectionView.dequeueReusableCellWithReuseIdentifier(CashPointSectionCell.identifier, forIndexPath: indexPath) as! CashPointSectionCell
        sectionCell.sectionName.text = CashPointSectionSource.sections()[indexPath.section].name
        sectionCell.sectionImage.image = CashPointSectionSource.sections()[indexPath.section].image
        return sectionCell
    }
    
    func locationCodeRow(indexPath: NSIndexPath, collectionView: UICollectionView, chashPoint: CashPoint) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return sectionCellForIndexPath(indexPath, inCollectionView: collectionView)
        } else {
            let contentCell : CashPointTextCell = collectionView .dequeueReusableCellWithReuseIdentifier(CashPointTextCell.identifier, forIndexPath: indexPath) as! CashPointTextCell
            contentCell.textLabel.text = "Data"
            return contentCell
        }
    }
    
    func locationNameRow(indexPath: NSIndexPath, collectionView: UICollectionView, chashPoint: CashPoint) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return sectionCellForIndexPath(indexPath, inCollectionView: collectionView)
        } else {
            let contentCell : CashPointTextCell = collectionView .dequeueReusableCellWithReuseIdentifier(CashPointTextCell.identifier, forIndexPath: indexPath) as! CashPointTextCell
            contentCell.textLabel.text = "Data"
            return contentCell
        }
    }
    
    func addressRow(indexPath: NSIndexPath, collectionView: UICollectionView, chashPoint: CashPoint) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return sectionCellForIndexPath(indexPath, inCollectionView: collectionView)
        } else {
            let contentCell : CashPointTextCell = collectionView .dequeueReusableCellWithReuseIdentifier(CashPointTextCell.identifier, forIndexPath: indexPath) as! CashPointTextCell
            contentCell.textLabel.text = "Data"
            return contentCell
        }
    }
    
    func cashPointTypeRow(indexPath: NSIndexPath, collectionView: UICollectionView, chashPoint: CashPoint) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return sectionCellForIndexPath(indexPath, inCollectionView: collectionView)
        } else {
            let contentCell : CashPointTextCell = collectionView .dequeueReusableCellWithReuseIdentifier(CashPointTextCell.identifier, forIndexPath: indexPath) as! CashPointTextCell
            contentCell.textLabel.text = "Data"
            return contentCell
        }
    }
    
    func technicalStateRow(indexPath: NSIndexPath, collectionView: UICollectionView, chashPoint: CashPoint) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return sectionCellForIndexPath(indexPath, inCollectionView: collectionView)
        } else {
            let contentCell : CashPointTextCell = collectionView .dequeueReusableCellWithReuseIdentifier(CashPointTextCell.identifier, forIndexPath: indexPath) as! CashPointTextCell
            contentCell.textLabel.text = "Data"
            return contentCell
        }
    }
    
    func cashStateRow(indexPath: NSIndexPath, collectionView: UICollectionView, chashPoint: CashPoint) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return sectionCellForIndexPath(indexPath, inCollectionView: collectionView)
        } else {
            let contentCell : CashPointTextCell = collectionView .dequeueReusableCellWithReuseIdentifier(CashPointTextCell.identifier, forIndexPath: indexPath) as! CashPointTextCell
            contentCell.textLabel.text = "Data"
            return contentCell
        }
    }
    
    func currentAmountRow(indexPath: NSIndexPath, collectionView: UICollectionView, chashPoint: CashPoint) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return sectionCellForIndexPath(indexPath, inCollectionView: collectionView)
        } else {
            let contentCell : CashPointTextCell = collectionView .dequeueReusableCellWithReuseIdentifier(CashPointTextCell.identifier, forIndexPath: indexPath) as! CashPointTextCell
            contentCell.textLabel.text = "Data"
            return contentCell
        }
    }
    
    func locationCollectionRow(indexPath: NSIndexPath, collectionView: UICollectionView, chashPoint: CashPoint) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return sectionCellForIndexPath(indexPath, inCollectionView: collectionView)
        } else {
            let contentCell : CashPointTextCell = collectionView .dequeueReusableCellWithReuseIdentifier(CashPointTextCell.identifier, forIndexPath: indexPath) as! CashPointTextCell
            contentCell.textLabel.text = "Data"
            return contentCell
        }
    }
    
    func nextCollectionRow(indexPath: NSIndexPath, collectionView: UICollectionView, chashPoint: CashPoint) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return sectionCellForIndexPath(indexPath, inCollectionView: collectionView)
        } else {
            let contentCell : CashPointTextCell = collectionView .dequeueReusableCellWithReuseIdentifier(CashPointTextCell.identifier, forIndexPath: indexPath) as! CashPointTextCell
            contentCell.textLabel.text = "Data"
            return contentCell
        }
    }
    
    func changeOrderPlannedRow(indexPath: NSIndexPath, collectionView: UICollectionView, chashPoint: CashPoint) -> UICollectionViewCell {
        if indexPath.row == 0 {
            return sectionCellForIndexPath(indexPath, inCollectionView: collectionView)
        } else {
            let contentCell : CashPointTextCell = collectionView .dequeueReusableCellWithReuseIdentifier(CashPointTextCell.identifier, forIndexPath: indexPath) as! CashPointTextCell
            contentCell.textLabel.text = "Data"
            return contentCell
        }
    }
}