//
//  NASAImageLibraryCollectionViewCellViewModel.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import Foundation

final class NASAImageLibraryCollectionViewCellViewModel {
    
    public var NASAImage: String
    public var NASAImageTitle: String
    public var NASAImageDescription: String
    public var NASAImageCreatedDate: String
    
    // MARK: - Init
    init(NASAImage: String, NASAImageTitle: String, NASAImageDescription: String, NASAImageCreatedDate: String) {
        self.NASAImage = NASAImage
        self.NASAImageTitle = NASAImageTitle
        self.NASAImageDescription = NASAImageDescription
        self.NASAImageCreatedDate = NASAImageCreatedDate
    }
}
