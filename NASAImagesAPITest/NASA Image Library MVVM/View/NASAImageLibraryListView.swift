//
//  NASAImageLibraryListView.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit

protocol NASAImageLibraryListViewDelegate: NSObject {
    func showNASAImageDetail(image: NASAImageLibraryCollectionViewCellViewModel)
}

final class NASAImageLibraryListView: UIView {
    
    public weak var delegate: NASAImageLibraryListViewDelegate?
    private var viewModel: NASAImageLibraryListViewViewModel?
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "search NASA images"
        return searchBar
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - Init
    init(frame: CGRect, viewModel: NASAImageLibraryListViewViewModel?) {
        super.init(frame: frame)
        self.viewModel = viewModel
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(searchBar, collectionView)
        SetUpConstarints()
        SetUpCollection()
        SetUpSearchBar()
        collectionView.register(NASAImageLibraryCollectionViewCell.self, forCellWithReuseIdentifier: NASAImageLibraryCollectionViewCell.identifier)
        viewModel?.delegate = self
        viewModel?.GetNASAImagesWith(searchString: "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func SetUpConstarints() {
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            searchBar.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
            searchBar.rightAnchor.constraint(equalTo: rightAnchor, constant: 10),
            searchBar.heightAnchor.constraint(equalToConstant: 40),
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            collectionView.leftAnchor.constraint(equalTo: leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: rightAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func SetUpCollection() {
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
    }
    
    private func SetUpSearchBar() {
        searchBar.delegate = viewModel
        searchBar.returnKeyType = .search
    }
    
}

// MARK: - NASAImageLibraryListViewViewModelDelegate
extension NASAImageLibraryListView: NASAImageLibraryListViewViewModelDelegate {
    
    func didLoadInitialNASAImages() {
        collectionView.reloadData()
    }
    
    func didSelectNASAImage(_ image: NASAImageLibraryCollectionViewCellViewModel) {
        delegate?.showNASAImageDetail(image: image)
    }
    
    func didSearchNASAImagesWIth(_ queryString: String) {
        viewModel?.GetNASAImagesWith(searchString: queryString)
    }
    
}
