//
//  AllDishes.swift
//  Yummie
//
//  Created by sevilay tanis on 20.04.2023.
//

import Foundation

struct AllDishes: Decodable {
    let categories: [DishCategory]?
    let populars: [Dish]?
    let specials: [Dish]?
}
