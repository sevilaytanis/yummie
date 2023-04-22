//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by sevilay tanis on 23.03.2023.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryTitleLabel: UILabel!
    
    func setUp(category: DishCategory){
        categoryTitleLabel.text = category.name
        categoryImageView.kf.setImage(with: category.image.asUrl)
        
       // print ("DEBUG: \(category.name)-------\(category.image)")
    }

}
