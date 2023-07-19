//
//  Link.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import Foundation

// MARK: - Link
struct Link: Codable {
    let href: String
    let rel: String
    let render: String?
}
