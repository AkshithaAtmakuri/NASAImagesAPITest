//
//  NASAImageCategoriesListViewController.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

final class NASAImageCategoriesListViewController: UIViewController, NASAImageCategoriesListViewDelegate {
    
    private let factory: NASAScreenFactoryProtocol?
    
    // MARK: - Init
    init(factory: NASAScreenFactoryProtocol?) {
        self.factory = factory
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Images"
        SetUpView()
        ShowNASAimages(didSelectCategory:         NasaImageCategory(id: 3, name: "NASA Images", icon: "NASA", sound: "camera.mp3"))
    }
    
    private func SetUpView() {
        guard let nasaImageCategoriesListView = factory?.createNASAImageCategoriesViews(view: .imagecategories, viewController: self) else {return}
        view.addSubview(nasaImageCategoriesListView)
        NSLayoutConstraint.activate([
            nasaImageCategoriesListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            nasaImageCategoriesListView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            nasaImageCategoriesListView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            nasaImageCategoriesListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func ShowNASAimages(didSelectCategory category: NasaImageCategory) {
        
        switch category.id {
        case 3:
            guard let vc = factory?.createImageCategoriesScreens(screen: .nasaimages) else {return}
            self.navigationController?.pushViewController(vc, animated: true)
            
        default:
            break
        }
    }
}
