//
//  Dish.swift
//  Yummie
//
//  Created by sevilay tanis on 28.03.2023.
//

import Foundation

struct Dish:Decodable {
    
    let id, name, description, image: String?
    let calories: Int?
    
    var formatedCalories: String {
        return "\(calories ?? 0) calories"
    }
}




