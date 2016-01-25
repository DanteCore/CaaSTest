//
//  BaseCollectionViewCell.swift
//  CaaSTest
//
//  Created by Serhii Onopriienko on 1/21/16.
//  Copyright © 2016 Edsson. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    class var identifier: String {
        get {
            return NSStringFromClass(self.classForCoder()).componentsSeparatedByString(".").last!
        }
    }
}
