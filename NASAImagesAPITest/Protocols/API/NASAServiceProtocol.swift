//
//  NASAServiceProtocol.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import Foundation

protocol NASAServiceProtocol {
    func execute<T: Codable>(type: T.Type, response: ResponseType,searchQuery: String, completion: @escaping(Result<T,Error>)->Void)
}
