//
//  UIView + Extensions.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach ({
           addSubview($0)
        })
    }
    
    func didCellTapped(indexPath: IndexPath) {
        AnimationClass().FlipAnimation(view: self)
    }
}
