//
//  DishListViewControllerTableViewCell.swift
//  Yummie
//
//  Created by sevilay tanis on 9.04.2023.
//

import UIKit

class DishListViewControllerTableViewCell: UITableViewCell {
    
    static let identifier = "DishListViewControllerTableViewCell"
    @IBOutlet var DishImageVieew: UIImageView!
    @IBOutlet var DishTitleLabel: UILabel!
    @IBOutlet var DishDescriptionLabel: UILabel!
    
    func setUp(dish: Dish)
    {
        DishImageVieew.kf.setImage(with: dish.image?.asUrl)
        DishTitleLabel.text = dish.name
        DishDescriptionLabel.text = dish.description
    }
        
    func setUp(order: Order)
    {
        DishImageVieew.kf.setImage(with: order.dish?.image?.asUrl)
        DishTitleLabel.text = order.dish?.name
        DishDescriptionLabel.text = order.dish?.description

    }
}
