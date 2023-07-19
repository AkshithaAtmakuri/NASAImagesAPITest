//
//  Item.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import Foundation

// MARK: - Item
struct Item: Codable {
    let href: String
    let data: [LibraryData]
    let links: [Link]
}
