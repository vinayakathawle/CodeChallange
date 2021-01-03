//
//  BreedListCell.swift
//  DogBreeds
//
//  Created by Vinayak Kakade on 03/01/21.
//

import UIKit
class CustomCell: UITableViewCell {
    
    @IBOutlet weak var breedImageView: ImagePlaceHolder!
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var lifespanLabel: UILabel!
    @IBOutlet weak var breedNameHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var breedLifeSpanHeightConstraint: NSLayoutConstraint!
    
}
