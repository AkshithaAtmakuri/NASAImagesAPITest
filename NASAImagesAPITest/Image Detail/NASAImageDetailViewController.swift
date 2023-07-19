//
//  NASAImageDetailViewController.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import UIKit
import SDWebImage

final class NASAImageDetailViewController: UIViewController {
    
    var imageTitle: String?
    var image: String?
    var sound: String?
    var imageDescription: String?
    var createdDate: String?
    
    
    private let NASADetailImage: RoundedImageView = {
        let imageView = RoundedImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let imageTitleLabel: UILabel = {
        let imageTitleLabel = UILabel()
        imageTitleLabel.font = .systemFont(ofSize: 14, weight: .bold)
        imageTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageTitleLabel.numberOfLines = 2
        return imageTitleLabel
    }()
    
    private let imageCreatedDate: UILabel = {
        let createdDateLabel = UILabel()
        createdDateLabel.font = .systemFont(ofSize: 14, weight: .medium)
        createdDateLabel.translatesAutoresizingMaskIntoConstraints = false
        return createdDateLabel
    }()
    
    private let detailText: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14, weight: .bold)
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubviews(NASADetailImage, imageTitleLabel, imageCreatedDate, detailText)
        SetUpConstraints()
        imageTitleLabel.text = imageTitle
        imageCreatedDate.text = createdDate
        detailText.text = imageDescription
        NASADetailImage.sd_setImage(with: URL(string: image ?? ""))
        NASADetailImage.sound = sound ?? ""
    }
    
    
    private func SetUpConstraints() {
        NSLayoutConstraint.activate([
            NASADetailImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            NASADetailImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            NASADetailImage.heightAnchor.constraint(equalToConstant: 200),
            NASADetailImage.widthAnchor.constraint(equalToConstant: 200),
            
            imageTitleLabel.topAnchor.constraint(equalTo: NASADetailImage.bottomAnchor, constant: 5),
            imageTitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            imageTitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            imageTitleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            imageCreatedDate.topAnchor.constraint(equalTo: imageTitleLabel.bottomAnchor, constant: 5),
            imageCreatedDate.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            imageCreatedDate.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            imageCreatedDate.heightAnchor.constraint(equalToConstant: 40),
                        
            detailText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailText.topAnchor.constraint(equalTo: imageCreatedDate.bottomAnchor, constant: 5),
            detailText.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            detailText.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
            detailText.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
