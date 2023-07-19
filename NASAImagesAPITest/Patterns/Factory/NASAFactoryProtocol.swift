//
//  NASAFactoryProtocol.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

protocol NASAScreenFactoryProtocol {
    func createNASAImageCategoriesViews(view: ImageCategoriesView, viewController: UIViewController & AnyObject)-> UIView
    func createImageCategoriesScreens(screen: ImageCategoriesScreen)-> UIViewController
    func createNASAScreens(screen: NASAScreens)-> UIViewController
}
