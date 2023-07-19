//
//  NASAImageLibraryListViewViewModel + Extensions.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

// MARK: - UICollectionViewDataSource
extension NASAImageLibraryListViewViewModel: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NASAImageLibraryCollectionViewCell.identifier, for: indexPath) as? NASAImageLibraryCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension NASAImageLibraryListViewViewModel: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        if let cell = collectionView.cellForItem(at: indexPath) as? NASAImageLibraryCollectionViewCell {
            cell.didCellTapped(indexPath: indexPath)
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.delegate?.didSelectNASAImage(self.cellViewModels[indexPath.row])
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension NASAImageLibraryListViewViewModel: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath)-> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        return CGSize(width: width, height: width * 1.5)
    }
}

// MARK: - UISearchBarDelegate
extension NASAImageLibraryListViewViewModel: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.delegate?.didSearchNASAImagesWIth("")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        self.delegate?.didSearchNASAImagesWIth(searchBar.text ?? "")
    }
}
