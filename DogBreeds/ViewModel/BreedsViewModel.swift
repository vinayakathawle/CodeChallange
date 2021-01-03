//
//  BreedsViewModel.swift
//  DogBreeds
//
//  Created by Vinayak Kakade on 03/01/21.
//

import Foundation
import UIKit

class BreedsViewModel {
    
    private let networkManager = NetworkManager()
    
    public var breeds: [BreedsList]?
    
    public func getDogBreeds(limit: String,
                             completion: ((_ errorType: ResponseType, _ errorMessage: String) -> Void)?) {
        networkManager.performNetworkTask(endpoint: ConfigAPI.breeds(limit),
                                          type: [BreedsList].self) { [weak self] (response, type, errorMessage) in
                                            self?.breeds = response
                                            completion?(type, errorMessage)
        }
    }
 
}
