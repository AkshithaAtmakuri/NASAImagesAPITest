//
//  NASAImageCategoriesCollectionViewViewModel.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import Foundation

final class NASAImageCategoriesCollectionViewCellViewModel {
    
    public var categoryName: String
    public var categoryImage: String
    public var imagesCount: Int
    
    // MARK: - Init
    init(categoryName: String, categoryImage: String, imagesCount: Int) {
        self.categoryName = categoryName
        self.categoryImage = categoryImage
        self.imagesCount = imagesCount
    }
}
