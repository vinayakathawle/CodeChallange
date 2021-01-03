//
//  EndpointType.swift
//  DogBreeds
//
//  Created by Vinayak Kakade on 03/01/21.
//

import Foundation

protocol EndpointType {
    var baseURL: URL { get }
    var path: String { get }
}
