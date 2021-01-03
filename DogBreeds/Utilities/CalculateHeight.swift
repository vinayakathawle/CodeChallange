//
//  CalculateHeight.swift
//  DogBreeds
//
//  Created by Vinayak Kakade on 03/01/21.
//

import Foundation
import UIKit

// Get Image as per the device size.
struct ImageRatio {
    static func getAspectRatioAccordingToDeviceSize(cellImageFrame:CGSize,imageWidth: CGFloat, imageHeigth: CGFloat)->CGFloat {
        
        let widthOffset = imageWidth - cellImageFrame.width
        let widthOffsetPercentage = (widthOffset*100)/imageWidth
        let heightOffset = (widthOffsetPercentage * imageHeigth)/100
        let effectiveHeight = imageHeigth - heightOffset
        return(effectiveHeight)
    }
}

//Get the lable height base on text, font and width.
struct LabelHeight {
    static func getHeigthForLabel(text:String, font:UIFont, width:CGFloat) -> CGFloat
    {
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
    
    // Get heigth for Breedname label
    static func getHeightForBreedName(width: CGFloat, breeds: BreedsList) -> CGFloat{
        return getHeigthForLabel(text: breeds.breeds?.first?.name ?? Constants.blankSpace, font: UIFont.init(name: Constants.fontName, size: Constants.fontSizeForName) ?? UIFont(), width: width - Constants.spacing)
    }
    
    // Get height for Breed Lifespan Label
    static func getHeightForBreedLifeSpan(width: CGFloat, breeds: BreedsList) -> CGFloat{
        return getHeigthForLabel(text: breeds.breeds?.first?.life_span ?? Constants.blankSpace, font: UIFont.init(name: Constants.fontName, size: Constants.fontSizeForLifeSpan) ?? UIFont(), width: width - Constants.spacing)
    }
    
}


