//
//  Configuration.swift
//  DogBreeds
//
//  Created by Vinayak Kakade on 03/01/21.
//

import Foundation

enum ConfigAPI {
    case breeds(_ limit: String)
}

extension ConfigAPI: EndpointType {
    var baseURL: URL {
        return URL(string: "https://api.thedogapi.com/v1")!
    }

    var path: String {
        switch self {
        case .breeds(let limit):
            return "/images/search?limit=\(limit)"
        }
    }
}

