//
//  NASAImageCategoriesListViewViewModel.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

protocol NASAImageCategoriesListViewViewModelDelegate: AnyObject {
    func didLoadInitialCategoryImages()
    func didSelectCategory(_ category: NasaImageCategory)
}

final class NASAImageCategoriesListViewViewModel: NSObject {
    
    public weak var delegate: NASAImageCategoriesListViewViewModelDelegate?
    
    private let nasaService: NASAServiceProtocol?
    
    let cellViewModels = [
        NASAImageCategoriesCollectionViewCellViewModel(categoryName: "NASA Images", categoryImage: "NASA", imagesCount: 0),
    ]
    let categories = [
        NasaImageCategory(id: 3, name: "NASA Images", icon: "NASA", sound: "camera.mp3"),
    ]
    
    
    // MARK: - Init
    init(nasaService: NASAServiceProtocol?) {
        self.nasaService = nasaService
    }
    
    func GetCategoryImages() {
        DispatchQueue.main.async {
            self.nasaService?.execute(type: NASAImageAndVideoLibrary.self, response: .nasaimages, searchQuery: "") { [weak self] result in
                switch result {
                case .success(let data):
                    var images = [NASAImageViewModel]()
                    let data = data.collection.items
                    DispatchQueue.main.async {
                        for item in data {
                            for image in item.links {
                                for info in item.data {
                                    images.append(NASAImageViewModel(image: image.href, title: info.title, description: info.description508 ?? ""))
                                }
                                self?.cellViewModels[0].categoryImage = images[0].image
                                self?.cellViewModels[0].imagesCount = images.count
                                self?.delegate?.didLoadInitialCategoryImages()
                            }
                        }
                    }
                    Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { timer in
                        DispatchQueue.main.async {
                            self?.cellViewModels[0].categoryImage = images[Int.random(in: 0...images.count - 1)].image
                            self?.delegate?.didLoadInitialCategoryImages()
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
