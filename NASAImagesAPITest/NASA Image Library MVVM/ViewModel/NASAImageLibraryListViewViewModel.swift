//
//  NASAImageLibraryListViewViewModel.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

protocol NASAImageLibraryListViewViewModelDelegate: NSObject {
    func didLoadInitialNASAImages()
    func didSelectNASAImage(_ image: NASAImageLibraryCollectionViewCellViewModel)
    func didSearchNASAImagesWIth(_ queryString: String)
}

final class NASAImageLibraryListViewViewModel: NSObject {
    
    public weak var delegate: NASAImageLibraryListViewViewModelDelegate?
    
    private let nasaService: NASAServiceProtocol?
    
    var cellViewModels = [NASAImageLibraryCollectionViewCellViewModel]()
    
    // MARK: - Init
    init(nasaService: NASAServiceProtocol?) {
        self.nasaService = nasaService
    }
    
    func GetNASAImagesWith(searchString: String) {
        nasaService?.execute(type: NASAImageAndVideoLibrary.self, response: .nasaimages, searchQuery: searchString) { [weak self] result in
            switch result {
            case .success(let data):
                self?.cellViewModels.removeAll()
                let data = data.collection.items
                DispatchQueue.main.async {
                    for item in data {
                        for image in item.links {
                            for info in item.data {
                                self?.cellViewModels.append(NASAImageLibraryCollectionViewCellViewModel(NASAImage: image.href, NASAImageTitle: info.title, NASAImageDescription: info.dataDescription ?? "", NASAImageCreatedDate: info.dateCreated))
                            }
                        }
                    }
                    self?.delegate?.didLoadInitialNASAImages()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
