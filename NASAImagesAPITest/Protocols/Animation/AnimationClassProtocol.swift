//
//  AnimationClassProtocol.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

protocol AnimationClassProtocol {
    func SpringAnimation<T: UIView>(view: T)
    func StartRotateImage(image: UIImageView)
    func StopRotateImage(image: UIImageView)
    func TabBarItemAnimation(item: UITabBarItem)
    func FlipAnimation<T: UIView>(view: T)
}
