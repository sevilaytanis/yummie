//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by sevilay tanis on 30.03.2023.
//

import UIKit

class DishLandscapeCollectionViewCell: UICollectionViewCell {

    static let identifier = String(describing: DishLandscapeCollectionViewCell.self)
    
    @IBOutlet var DishImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var caloryLabel: UILabel!
    
    func setUp(dish: Dish){
        DishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        descriptionLabel.text = dish.description
        caloryLabel.text = dish.formatedCalories
    }
}
