//
//  OnBoardingCollectionViewCell.swift
//  Yummie
//
//  Created by sevilay tanis on 19.03.2023.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell{
    
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    
    @IBOutlet var slideTitleLbl: UILabel!
    @IBOutlet var slideDescriptionLbl: UILabel!
    @IBOutlet var slideImageView: UIImageView!
    
    func setup(_ slide: OnBoardingSlide){
      
        slideImageView.image = slide.image
        slideTitleLbl.text=slide.title
        slideDescriptionLbl.text=slide.description
        
    }
}
