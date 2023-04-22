//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by sevilay tanis on 28.03.2023.
//

import UIKit

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: DishPortraitCollectionViewCell.self)
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dishImageView: UIImageView!
    @IBOutlet var caleroiesLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func setUp(dish: Dish)
    {
        titleLabel.text=dish.name
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        caleroiesLabel.text=dish.formatedCalories
        descriptionLabel.text=dish.description
    }
}
