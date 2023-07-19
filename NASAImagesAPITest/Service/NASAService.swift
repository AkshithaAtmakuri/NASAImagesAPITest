//
//  NASAService.swift
//  NASAImagesAPITest
//
//  Created by Akshitha atmakuri on 18/07/23.
//

import Alamofire

enum ResponseType {
    case nasaimages
    case nasavideos
}

class NASAService: NASAServiceProtocol {
    
    private var url = ""
        
    struct Contacts {
        static var apiKey = "iN4Lu3Ku0270mo9YWlhXAgJAuwbEQ8aobiGZo6tX"
    }

    // MARK: - Init
    init() {
    }
    
    private func UrlForResponseWith(queryString: String, response: ResponseType) -> String {
        switch response {
        case .nasaimages:
        return "https://images-api.nasa.gov/search?q=\(queryString)&media_type=image"
        case .nasavideos:
            return "https://images-api.nasa.gov/search?q=\(queryString)&media_type=video"
        }
    }
    
    func execute<T>(type: T.Type, response: ResponseType, searchQuery: String, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable, T : Encodable {
        let queryString = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? searchQuery
        
        url = UrlForResponseWith(queryString: queryString, response: response)
        
        AF.request(url).responseData { response in
            guard let data = response.data else {return}
            
            var response: T
            
            do {
                response = try JSONDecoder().decode(T.self, from: data)
                completion(.success(response))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
    }

}
