//
//  NASAFactory.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

final class NASAScreenFactory: NASAScreenFactoryProtocol {
    
    func createNASAImageCategoriesViews(view: ImageCategoriesView, viewController: UIViewController & AnyObject)-> UIView {
        switch view {
        case .imagecategories:
            let view = NASAImageCategoriesListView(
                frame: .zero,
                viewModel: Injection.shared.makeContainer().resolve(NASAImageCategoriesListViewViewModel.self)
            )
            view.delegate = viewController as? any NASAImageCategoriesListViewDelegate
            return view
        case .nasaimages:
            let view = NASAImageLibraryListView(
                frame: .zero, viewModel: Injection.shared.makeContainer().resolve(NASAImageLibraryListViewViewModel.self)
            )
            view.delegate = viewController as? any NASAImageLibraryListViewDelegate
            return view
        }
    }
    
    func createImageCategoriesScreens(screen: ImageCategoriesScreen) -> UIViewController {
        switch screen {
        case .nasaimages:
            let vc = NASAImageLibraryViewController(
                factory: Injection.shared.makeContainer().resolve(NASAScreenFactoryProtocol.self)
            )
            vc.title = "NASA Images"
            vc.navigationItem.largeTitleDisplayMode = .never
            return vc
        }
    }
    
    func createNASAScreens(screen: NASAScreens)-> UIViewController {
        switch screen {
        case .imagecategories:
            let vc = NASAImageCategoriesListViewController(
                factory: Injection.shared.makeContainer().resolve(NASAScreenFactoryProtocol.self)
            )
            vc.navigationItem.largeTitleDisplayMode = .automatic
            vc.tabBarItem = UITabBarItem(title: "Images", image: UIImage(named: "images"), selectedImage: UIImage(named: "images selected"))
            return vc
        }
    }
}
