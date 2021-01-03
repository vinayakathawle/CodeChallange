//
//  NetworkManager.swift
//  DogBreeds
//
//  Created by Vinayak Kakade on 03/01/21.
//

import Foundation

enum ResponseType {
    case success
    case faliure
}

struct NetworkManager {
    
    func performNetworkTask<T: Codable>(endpoint: ConfigAPI,
                                        type: T.Type,
                                        completion: ((_ response: T?, _ errorType:ResponseType, _ errorMessage: String) -> Void)?) {
        let urlString = endpoint.baseURL.appendingPathComponent(endpoint.path).absoluteString.removingPercentEncoding
        guard let urlRequest = URL(string: urlString ?? "") else { return }
        
        let urlSession = URLSession.shared.dataTask(with: urlRequest, completionHandler: { (data, response, error) in
            if let error = error {
                completion?(nil, .faliure, error.localizedDescription)
                return
            }
            
            guard let data = data else {
                completion?(nil, .faliure, "No Data avaibale")
                return
            }
            
            let response = Response(data: data)
            guard let decoded = response.decode(type) else {
                return
            }
            completion?(decoded, .success, "Successfull")
            
        })
        
        urlSession.resume()
    }
    
}
