//
//  Breeds.swift
//  DogBreeds
//
//  Created by Vinayak Kakade on 03/01/21.
//

import Foundation
import UIKit

struct BreedsList: Codable {
    let id: String
    let url: String?
    let width: CGFloat?
    let height: CGFloat?
    let breeds: [breedDetail]?
}

struct breedDetail: Codable {
    let id: Int
    let name: String?
    let bred_for: String?
    let breed_group: String?
    let life_span: String?
    let temperament: String?
    let reference_image_id: String?
}


